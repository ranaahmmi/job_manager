import 'package:flutter/material.dart';
import 'package:job_manager/data/models/user_model.dart';
import 'package:job_manager/helper/app_icons_icons.dart';
import 'package:job_manager/helper/constants.dart';
import 'package:job_manager/helper/page_navigation_animation.dart';
import 'package:job_manager/screens/jobs_screen.dart';
import 'package:job_manager/screens/splash_screen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool savePhoto = false;
  User? user;

  @override
  void initState() {
    user = User.fromJson(getJSONAsync('user'));
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppHeader(title: 'User Profile', child: SizedBox()).px(20),
          padding2x,
          ColoredBox(
            color: context.colors.primary,
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: context.colors.secondary,
                  size: 30,
                ).p(12).box.roundedFull.color(Colors.white).make(),
                15.widthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ("${user?.firstName ?? ''} ${user?.lastName ?? ""}")
                        .headingText(
                          context,
                          14,
                        )
                        .text
                        .extraBlack
                        .color(context.colors.secondary)
                        .make(),
                    5.heightBox,
                    (user?.email ?? '')
                        .txt(context, 13, color: context.colors.secondary)
                  ],
                )
              ],
            ).p(20),
          ),
          Column(
            children: [
              AppTile(
                title: 'Feedback',
                icon: AppIcons.comments_icon,
                onPresed: () {},
              ),
              AppTile(
                title: 'Change Password',
                icon: AppIcons.change_password_icon,
                onPresed: () {},
              ),
              AppTile(
                title: 'Save photos to device',
                icon: AppIcons.photos_icon,
                onPresed: () {},
                trailing: Switch(
                  value: savePhoto,
                  onChanged: (value) {
                    setState(() {
                      savePhoto = value;
                    });
                  },
                  activeTrackColor: context.colors.primary,
                ),
              ),
              AppTile(
                title: 'Logout',
                icon: AppIcons.logout,
                onPresed: () async {
                  await setValue('islogin', false).then((value) => {
                        Navigator.push(context,
                            SlideRightRoute(page: const SplashScreen()))
                      });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AppTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPresed;
  final Widget? trailing;
  const AppTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPresed,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          leading: Icon(
            icon,
            size: 26,
            color: context.colors.secondary,
          ),
          title: title.headingText(context, 14, color: context.colors.primary),
          trailing: trailing ??
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: context.colors.secondary,
              ),
          onTap: onPresed,
        ),
        const Divider(
          height: 1,
        )
      ],
    );
  }
}
