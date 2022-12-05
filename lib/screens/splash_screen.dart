import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:job_manager/helper/page_navigation_animation.dart';
import 'package:job_manager/screens/jobs_screen.dart';
import 'package:job_manager/screens/login_screen.dart';
import 'package:job_manager/screens/nav_bar_home.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
        Navigator.pushReplacement(
          context,
          SlideRightRoute(
            page: const HomeNav(
                // user: User.fromJson(
                //   getJSONAsync('user'),
                // ),
                ),
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
      backgroundColor: Colors.white,
      body: Center(
        child: BounceInDown(
          duration: const Duration(seconds: 1),
          child: Image.asset(
            'assets/icons/ibd.png',
            height: 100,
          ),
        ),
      ),
    );
  }
}
