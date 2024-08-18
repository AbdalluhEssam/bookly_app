import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../domain/entities/book_entity.dart';

class FeaturedBooksListView extends StatelessWidget {
  const  FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          padding: const EdgeInsetsDirectional.only(
              start: Styles.defaultPadding),
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.bookDetailsView,extra: books[index]);
              },
              child: CustomBookImage(
                bookImage:books[index].image!,
              )),
          separatorBuilder: (context, index) => const SizedBox(
            width: 12,
          ),
          itemCount: books.length),
    );
  }
}
