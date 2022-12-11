import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_manager/data/repository/custom_providers.dart';
import 'package:job_manager/helper/alert_box.dart';
import 'package:job_manager/helper/app_icons_icons.dart';
import 'package:job_manager/screens/jobs_screen.dart';
import 'package:job_manager/screens/map.dart';
import 'package:job_manager/screens/profile_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeNav extends ConsumerWidget {
  const HomeNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navBarIndex);

    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          return _onBackPressed(context);
        },
        child: ColoredBox(
          color: Colors.white,
          child: SafeArea(
            child: screenSelect(index),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 60,
        child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: context.primaryColor,
          elevation: 10,
          iconSize: 20,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            height: 1.8,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 10, height: 1.7),
          selectedItemColor: context.accentColor,
          selectedIconTheme: IconThemeData(color: context.accentColor),
          unselectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedItemColor: Colors.white,
          enableFeedback: true,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            ref.read(navBarIndex.notifier).state = value;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                AppIcons.business_rules,
                size: 20,
              ),
              label: 'Jobs',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                AppIcons.map,
                size: 20,
              ),
              label: 'Maps',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     AppIcons.addition_color_outline,
            //     size: 20,
            //   ),
            //   label: ' Create',
            // ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 20,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: index,
        ),
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    return await showCustomDialogBottomAnimation(
        context: context,
        title: 'Do you really want to exit',
        onConfirm: () => Navigator.pop(context, true),
        onCancel: () => Navigator.pop(context, false));
  }

  Widget screenSelect(int index) {
    switch (index) {
      case 0:
        return const JobsScreen();
      case 1:
        return const MapPicker(
          lat: 31.5204,
          lng: 74.3587,
        );
      // case 2:
      //   return MyJobScreen();
      case 2:
        return const ProfileScreen();
      default:
        return const JobsScreen();
    }
  }
}
