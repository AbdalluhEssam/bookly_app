import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class BestListViewItem extends StatelessWidget {
  const BestListViewItem({super.key, required this.bookModel});

  final BookEntity bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: 150,
        child: Row(children: [
          CustomBookImage(

              bookImage: bookModel.image ?? ""),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookModel.title ?? "",
                  style: Styles.textStyle20.copyWith(
                    fontFamily: kGtSectraFine,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  bookModel.authorName ?? '',
                  style: Styles.textStyle14,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Free", style: Styles.textStyle20),
                    BookRatting(
                      bookModel: bookModel,
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class BookRatting extends StatelessWidget {
  const BookRatting({
    super.key,
    required this.bookModel,
  });

  final BookEntity bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 14,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
            (bookModel.rating == "null"
                    ? "0.0"
                    : bookModel.rating)
                .toString(),
            style: Styles.textStyle16
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(
          width: 8,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            "(${bookModel.rating == "null" ? "0" : bookModel.rating})",
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
