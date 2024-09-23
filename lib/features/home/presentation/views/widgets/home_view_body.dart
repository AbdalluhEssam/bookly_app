import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../domain/entities/book_entity.dart';
import '../../manger/newset_books_cubit/newset_books_cubit.dart';
import 'best_seller_list_view_item.dart';
import 'custom_app_bar.dart';
import 'custom_error_widget.dart';
import 'custom_loading_indicator.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<BookEntity> books = [];
  late ScrollController _scrollController;
  int nextPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    double currentScroll = _scrollController.position.pixels;
    double maxScroll = _scrollController.position.maxScrollExtent;

    // Trigger pagination when the user scrolls near the end of the list (70% of the list height)
    if (currentScroll >= (maxScroll * 0.7)) {
      // Fetch more data only if pagination is not currently loading
      final newSetBooksCubit = BlocProvider.of<NewSetBooksCubit>(context);
      if (newSetBooksCubit.state is! NewSetBooksPaginationLoading) {
        newSetBooksCubit.fetchNewSetBooks(pageNumber: nextPage++);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              // Dynamic list view
              FeaturedBooksListViewBloc(),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
                child: Text(
                  "Newest Books",
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
        BlocConsumer<NewSetBooksCubit, NewSetBooksState>(
          listener: (context, state) {
            if (state is NewSetBooksSuccess) {
              // Add new books to the existing list
              setState(() {
                books.addAll(state.books);
              });
            }

            if (state is NewSetBooksPaginationFailure) {
              // Display an error message on pagination failure
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errMessage,
                    style: const TextStyle(color: Colors.black),
                  ),
                  duration: const Duration(seconds: 3),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is NewSetBooksSuccess ||
                state is NewSetBooksPaginationLoading ||
                state is NewSetBooksPaginationFailure) {
              // Use SliverList instead of ListView for proper scroll integration
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.bookDetailsView,
                          extra: books[index],
                        );
                      },
                      child:  BestListViewItem(
                              bookModel: books[index]),
                    );
                  },
                  childCount: books.length,
                ),
              );
            } else if (state is NewSetBooksFailure) {
              // Display error widget
              return SliverToBoxAdapter(
                child: CustomErrorWidget(error: state.errMessage),
              );
            } else {
              // Show loading indicator while fetching books
              return const SliverToBoxAdapter(
                child: CustomLoadingIndicator(),
              );
            }
          },
        ),
      ],
    );
  }
}
