import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class SlidingImage extends StatelessWidget {
  const SlidingImage({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) => SlideTransition(
          position: slidingAnimation,
          child: Image.asset(
            AssetsApp.logo,
          )),
    );
  }
}
