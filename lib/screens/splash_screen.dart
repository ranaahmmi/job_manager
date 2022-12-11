import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_manager/data/riverpod/jobs_notifier_provider.dart';
import 'package:job_manager/helper/page_navigation_animation.dart';
import 'package:job_manager/screens/login_screen.dart';
import 'package:job_manager/screens/nav_bar_home.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    initFunction();
    super.initState();
  }

  initFunction() async {
    Future.delayed(const Duration(seconds: 2), () {
      print(getBoolAsync('islogin'));
      print(getJSONAsync('user'));
      if (getBoolAsync('islogin')) {
        ref.read(jobListNotifierProvider.notifier).getJobs();
        Navigator.pushReplacement(
          context,
          SlideRightRoute(
            page: const HomeNav(),
          ),
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          SlideRightRoute(page: const LoginScreen()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: "appLogo",
          child: BounceInDown(
            duration: const Duration(seconds: 1),
            child: Image.asset(
              'assets/icons/logo.png',
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
