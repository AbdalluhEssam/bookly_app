import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'best_seller_list_view_item.dart';
import 'button_action.dart';

class BoolDetailsSection extends StatelessWidget {
  const BoolDetailsSection({super.key, required this.bookModel});

  final BookEntity bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
            padding:
                EdgeInsets.symmetric(horizontal: width * 0.2, vertical: 35),
            child: CustomBookImage(
              bookImage: bookModel.image ?? "",
            )),
        Text(
          bookModel.title ?? "",
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.authorName ?? "",
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
         BookRatting(bookModel: bookModel),
        const SizedBox(
          height: 36,
        ),
        ButtonAction(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
