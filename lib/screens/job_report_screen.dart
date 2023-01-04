import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_manager/helper/app_icons_icons.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:job_manager/data/models/job_model.dart';
import 'package:job_manager/helper/constants.dart';
import 'package:job_manager/helper/style.dart';

class JobReportScreen extends ConsumerStatefulWidget {
  final JobModel jobs;

  const JobReportScreen({Key? key, required this.jobs}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _JobReportScreenState();
}

class _JobReportScreenState extends ConsumerState<JobReportScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        padding1x,
        QuestionListTile(
          title: "Is the color correct?",
          icon: Icon(
            Icons.check_circle,
            color: context.colors.secondary,
            size: 24,
          ),
        ),
        QuestionListTile(
          title: "Is the color correct?",
          icon: Icon(
            Icons.check_circle,
            color: context.colors.secondary,
            size: 24,
          ),
          child: Column(children: [
            padding1x,
            TextFormField(
              style: context.bodySmall,
              decoration: const InputDecoration(
                hintText: 'Enter description',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            ),
            padding1x,
          ]),
        ),
        QuestionListTile(
          title: "Remove any installation or equipment?",
          icon: Icon(
            Icons.cancel,
            color: context.colors.error,
            size: 24,
          ),
        ),
        JobDetailImageUpload(title: 'Fix leakage (Before)', uploadImage: () {}),
        JobDetailImageUpload(title: 'Fix leakage (After)', uploadImage: () {})
      ],
    ).px(20);
  }
}

class JobDetailImageUpload extends StatelessWidget {
  final String title;
  final File? image;
  final VoidCallback uploadImage;
  const JobDetailImageUpload({
    Key? key,
    required this.title,
    this.image,
    required this.uploadImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        padding2x,
        "Fix leakage (Before)".txt(context, 14, color: context.colors.primary),
        padding2x,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            image == null
                ? Image.asset(
                    "assets/images/emptyImage.png",
                    height: 45,
                  )
                : Image.file(
                    image!,
                    height: 45,
                    width: 45,
                    fit: BoxFit.cover,
                  ),
            IconButton(
              icon: Icon(
                AppIcons.photo_icon,
                size: 28,
                color: context.colors.secondary,
              ),
              onPressed: uploadImage,
            )
          ],
        ),
        15.heightBox,
        Divider(
          height: 0,
          thickness: 2,
          color: AppColors.grey.withOpacity(0.5),
        ),
      ],
    );
  }
}

class QuestionListTile extends StatelessWidget {
  final String title;
  final Icon icon;
  final Widget? child;
  const QuestionListTile({
    Key? key,
    this.child,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        padding2x,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            title.txt(context, 14, color: context.colors.primary),
            icon
          ],
        ),
        child != null ? child! : padding2x,
        Divider(
          height: 0,
          thickness: 2,
          color: AppColors.grey.withOpacity(0.5),
        ),
      ],
    );
  }
}
