import 'package:flutter/material.dart';
import 'package:job_manager/helper/app_buttons.dart';
import 'package:velocity_x/velocity_x.dart';

showCustomDialogBottomAnimation(
    {required BuildContext context,
    required String title,
    bool isShowCancelButton = true,
    double height = 150,
    String confirmButtonText = 'Yes',
    String cancelButtonText = 'No',
    required VoidCallback onCancel,
    required VoidCallback onConfirm}) {
  return showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    context: context,
    pageBuilder: (BuildContext context, __, ___) {
      return Material(
        color: Colors.transparent,
        child: Align(
            alignment: Alignment.center,
            child: Center(
              child: Container(
                height: height,
                width: context.screenWidth * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    10.heightBox,
                    const Spacer(),
                    title.text
                        .fontWeight(FontWeight.w500)
                        .size(18)
                        .black
                        .make(),
                    const Spacer(
                      flex: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppCustomButton(
                            width: 100,
                            height: 40,
                            shadowColor: context.primaryColor,
                            elevation: 4,
                            title: confirmButtonText,
                            onPressed: onConfirm),
                        if (isShowCancelButton)
                          Row(
                            children: [
                              20.widthBox,
                              AppCustomButton(
                                  width: 100,
                                  height: 40,
                                  shadowColor: context.primaryColor,
                                  elevation: 4,
                                  title: cancelButtonText,
                                  onPressed: onCancel),
                            ],
                          ),
                      ],
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ).p(10),
              ),
            )),
      );
    },
    transitionBuilder: (context, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(CurvedAnimation(
          parent: anim,
          curve: Curves.easeInOutCirc,
        )),
        child: child,
      );
    },
  );
}
