import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
    );
  }
}
