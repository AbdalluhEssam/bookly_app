import 'package:bookly_app/features/home/presentation/manger/newset_books_cubit/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../domain/entities/book_entity.dart';
import 'best_seller_list_view_item.dart';
import 'custom_error_widget.dart';
import 'custom_loading_indicator.dart';

class NewSetBooksListViewV extends StatefulWidget {
  const NewSetBooksListViewV({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<StatefulWidget> createState() => _NewSetBooksListViewVState();
}

class _NewSetBooksListViewVState extends State<NewSetBooksListViewV> {
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
    return ListView.separated(
      // prevent conflict with outer scroll
      controller: _scrollController,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          GoRouter.of(context)
              .push(AppRouter.bookDetailsView, extra: widget.books[index]);
        },
        child: BestListViewItem(bookModel: widget.books[index]),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
      itemCount: widget.books.length,
    );
  }
}

class FeaturedBestSellerListView extends StatefulWidget {
  const FeaturedBestSellerListView({super.key});

  @override
  State<FeaturedBestSellerListView> createState() =>
      _FeaturedBestSellerListViewState();
}

class _FeaturedBestSellerListViewState
    extends State<FeaturedBestSellerListView> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewSetBooksCubit, NewSetBooksState>(
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
          // Return the list with pagination
          return NewSetBooksListViewV(books: books);
        } else if (state is NewSetBooksFailure) {
          // Display error widget
          return CustomErrorWidget(error: state.errMessage);
        } else {
          // Show loading indicator while fetching books
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
