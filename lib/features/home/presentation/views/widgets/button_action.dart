import 'package:bookly_app/core/utils/function/launch_url.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class ButtonAction extends StatelessWidget {
  const ButtonAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(onPressed: () {

            },
              text: "Free",
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius:const BorderRadius.horizontal(left: Radius.circular(16)),
            ),
          ),
           Expanded(
            child: CustomButton(
              onPressed: () {
                launchCustomUrl(context, bookModel.volumeInfo.previewLink ?? "");
              },
              fontSize: 16,
              text: getText(bookModel),
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius:const BorderRadius.horizontal(right: Radius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }
}

String getText(BookModel bookModel) {
  if (bookModel.volumeInfo.previewLink == null) {
    return "Not Available";
  } else {
    return "Preview";
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    this.borderRadius,
    required this.text,
    this.fontSize, this.onPressed,
  });

  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? fontSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(16)),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: Styles.textStyle18.copyWith(
                color: textColor,
                fontWeight: FontWeight.w900,
                fontSize: fontSize ?? 18),
          )),
    );
  }
}
