import 'package:get/get.dart';

import '../../../onbording/presentation/views/onboarding_view.dart';

abstract class SplashController extends GetxController {
  navigateToHome();
}

class SplashControllerImp extends SplashController {
  @override
  navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.to(
          () => const OnBoardingView(),
        );
        // Get.to(() => const OnBoardingView(),
        //     transition: Transition.fade, duration: kTranstionDuration);
        // Get.toNamed(AppRoute.onBoarding);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    navigateToHome();
  }
}
