import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/sliding_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    initSlidingAnimation();
    Future.delayed(kTransparentDuration, () {
      animationController
          .reverse()
          .then((value) => GoRouter.of(context).push(AppRouter.homeView));
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlidingImage(slidingAnimation: slidingAnimation),
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

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, -5), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
