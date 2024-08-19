import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../domain/entities/book_entity.dart';
import '../../manger/featured_books_cubit/featured_books_cubit.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<StatefulWidget> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late ScrollController _scrollController = ScrollController();
  int nextPage = 1;
  bool isLoading = false;

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

  void _onScroll() async {
    double currentScroll = _scrollController.position.pixels;
    double maxScroll = _scrollController.position.maxScrollExtent;

    if (currentScroll >= (maxScroll * 0.7)) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(
          pageNumber: nextPage++,
        );
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        padding: const EdgeInsetsDirectional.only(start: Styles.defaultPadding),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .push(AppRouter.bookDetailsView, extra: widget.books[index]);
          },
          child: CustomBookImage(
            bookImage: widget.books[index].image!,
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 12,
        ),
        itemCount: widget.books.length,
      ),
    );
  }
}
