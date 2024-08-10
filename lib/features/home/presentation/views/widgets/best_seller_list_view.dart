import 'package:flutter/material.dart';

import 'best_seller_list_view_item.dart';

class FeaturedBastSellerListView extends StatelessWidget {
  const FeaturedBastSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => const BestListViewItem(),
        separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
        itemCount: 10);
  }
}
