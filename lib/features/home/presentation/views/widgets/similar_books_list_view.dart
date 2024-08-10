
import 'package:flutter/material.dart';

import 'custom_book_item.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          itemBuilder: (context, index) => const CustomBookImage(),
          separatorBuilder: (context, index) => const SizedBox(
            width: 8,
          ),
          itemCount: 5),
    );
  }
}
