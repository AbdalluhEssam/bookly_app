import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          padding: const EdgeInsetsDirectional.only(start: Styles.defaultPadding),
          itemBuilder: (context, index) => const FeaturedListViewItem(),
          separatorBuilder: (context, index) => const SizedBox(
                width: 12,
              ),
          itemCount: 5),
    );
  }
}
