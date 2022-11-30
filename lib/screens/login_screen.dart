import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:job_manager/data/models/user_model.dart';
import 'package:job_manager/data/repository/auth_repository.dart';
import 'package:job_manager/helper/app_buttons.dart';
import 'package:job_manager/helper/constants.dart';
import 'package:job_manager/helper/page_navigation_animation.dart';
import 'package:job_manager/helper/style.dart';
import 'package:job_manager/screens/home_screen.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                SizedBox(
                  height: 172,
                  child: Center(
                    child: Image.asset(
                      'assets/icons/ibdw.png',
                      height: 83,
                      color: Colors.black,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: SlideInUp(
                    duration: const Duration(milliseconds: 700),
                    child: Column(
                      children: [
                        40.height,
                        AppTextField(
                          controller: _emailController,
                          textFieldType: TextFieldType.EMAIL,
                          decoration: Constants().appInputDecoration(
                              context, 'Username', AppColors.primaryColor,
                              icon: Icons.email_outlined),
                        ),
                        20.height,
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
                              icon: Icons.lock),
                        ),
                        30.height,
                        AppCustomButton(
                          height: 60,
                          title: 'Sign In',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              try {
                                final User user = await AuthRepository().signIn(
                                    _emailController.text,
                                    _passwordController.text,
                                    rememberMe);
                                if (!mounted) return;
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  SlideRightRoute(
                                      page: HomeScreen(
                                    user: user,
                                  )),
                                  (Route<dynamic> route) => false,
                                );
                              } catch (e) {
                                showCustomDialogBottomAnimation(
                                  context: context,
                                  title: e.toString(),
                                  isShowCancleButton: false,
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
                        30.height,
                        CheckboxListTile(
                          title: "Remember me"
                              .text
                              .color(AppColors.primaryColor)
                              .size(14)
                              .make(),
                          dense: true,
                          value: rememberMe,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {
                            rememberMe = value!;
                            setState(() {});
                          },
                        ),
                        20.height,
                      ],
                    ).px(35),
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
