import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this ,
        duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(begin: const Offset(0 , 2), end: const Offset(0 , 0)).animate(animationController);

    animationController.forward();

    Future.delayed(const Duration(seconds: 2),()
        {
          // Get.to(() => const HomeView() , transition: Transition.fade , duration: kTransitionDuration);

        GoRouter.of(context).push(AppRouter.kHomeView);
        }
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetsData.logo,),
          SlidingText(),
        ],
    );
  }

  AnimatedBuilder SlidingText() {
    return AnimatedBuilder(
          animation: slidingAnimation,
          builder: (context, _) {
            return SlideTransition(
              position: slidingAnimation,
              child: const Text(
                  'Read Free Books',
              textAlign: TextAlign.center,),
            );
          }
        );
  }
}
