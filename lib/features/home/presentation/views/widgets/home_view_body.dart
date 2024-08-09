import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomApBar(),
          FeaturedBooksListView(),
          SizedBox(
            height: 40,
          ),
          Text(
            "Best Seller",
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 16,
          ),
          BestSellerListViewItem()
        ],
      ),
    );
  }
}

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(children: [
        AspectRatio(
          aspectRatio: 2 / 3,
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: Colors.white,
              image: const DecorationImage(
                image: AssetImage(AssetsApp.bookImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Harry Potter and the Goblet of Fire",
              style: Styles.textStyle20,
            ),
            const Text("Harry Potter and the Goblet of Fire"),
            const  Row(
              children: [
                Text("19.99\$"),
                Text("2"),
              ],
            )
          ],
        )
      ]),
    );
  }
}
