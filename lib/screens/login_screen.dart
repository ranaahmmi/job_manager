import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_manager/data/repository/auth_repository.dart';
import 'package:job_manager/data/riverpod/jobs_notifier_provider.dart';
import 'package:job_manager/helper/alert_box.dart';
import 'package:job_manager/helper/app_buttons.dart';
import 'package:job_manager/helper/app_icons_icons.dart';
import 'package:job_manager/helper/constants.dart';
import 'package:job_manager/helper/page_navigation_animation.dart';
import 'package:job_manager/helper/style.dart';
import 'package:job_manager/screens/nav_bar_home.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  bool rememberMe = true;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LoadingOverlay(
        isLoading: isLoading,
        color: Colors.black,
        progressIndicator: Loader(
          size: 50,
        ),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                (context.screenWidth * 0.20).heightBox,
                Center(
                  child: Hero(
                    tag: "appLogo",
                    child: Image.asset(
                      'assets/icons/logo.png',
                      height: 83,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: SlideInUp(
                    duration: const Duration(milliseconds: 700),
                    child: Column(
                      children: [
                        70.height,
                        AppTextField(
                          controller: _emailController,
                          textFieldType: TextFieldType.EMAIL,
                          decoration: Constants().appInputDecoration(
                              context, 'Username', AppColors.primaryColor,
                              icon: AppIcons.mail, iconSize: 18),
                        ),
                        padding3x,
                        AppTextField(
                          controller: _passwordController,
                          textFieldType: TextFieldType.PASSWORD,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          decoration: Constants().appInputDecoration(
                              context, 'Password', AppColors.primaryColor,
                              icon: AppIcons.lock, iconSize: 22),
                        ),
                        padding5x,
                        AppCustomButton(
                          height: 50,
                          textColor: context.colors.secondary,
                          title: 'Sign In',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              try {
                                await AuthRepository()
                                    .login(_emailController.text,
                                        _passwordController.text, rememberMe)
                                    .then((value) {
                                  ref
                                      .read(jobListNotifierProvider.notifier)
                                      .getJobs();
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    SlideRightRoute(page: const HomeNav()),
                                    (Route<dynamic> route) => false,
                                  );
                                });
                              } catch (e) {
                                showCustomDialogBottomAnimation(
                                  context: context,
                                  title: e.toString(),
                                  isShowCancelButton: false,
                                  confirmButtonText: "Cancel",
                                  onConfirm: () => Navigator.pop(context),
                                  onCancel: () => Navigator.pop(context),
                                );
                              }
                              isLoading = false;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ).px(20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
