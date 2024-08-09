import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsApp.logo,
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Read Free Books",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
