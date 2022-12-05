import 'package:flutter/material.dart';
import 'package:job_manager/data/models/job_model.dart';
import 'package:job_manager/helper/constants.dart';
import 'package:job_manager/helper/custom_card.dart';
import 'package:velocity_x/velocity_x.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  String dropdownValue = 'Today';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          defaultPadding,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "jobs".headingText(context, 15),
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.keyboard_arrow_down,
                    size: 20, color: context.colors.primary),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: context.colors.primary, fontSize: 15),
                underline: const SizedBox(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Today', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          ),
          padding2x,
          const JobCard(
            isSelected: true,
          ),
          padding3x,
          const JobCard()
        ],
      ).px(20),
    );
  }
}

class JobCard extends StatelessWidget {
  final JobModel? job;
  final bool isSelected;
  const JobCard({
    Key? key,
    this.job,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        isBorder: true,
        isShadow: true,
        color: isSelected ? context.colors.secondary : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "16:00 - 19:00"
                    .text
                    .color(context.colors.primary)
                    .size(11)
                    .make(),
                "In 30 mins "
                    .text
                    .color(context.colors.primary)
                    .size(11)
                    .make(),
              ],
            ),
            padding1x,
            "First visit"
                .headingText(context, 15)
                .text
                .color(context.colors.primary)
                .make(),
            padding2x,
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod "
                .headingText(context, 12)
                .text
                .color(isSelected ? Colors.white : context.titleLarge!.color)
                .make()
                .pOnly(right: 120),
            padding1x,
            "Lorem ipsum dolor sit amet, consetetur sadipscing "
                .txt(context, 12)
                .text
                .color(isSelected ? Colors.white : context.titleLarge!.color)
                .make(),
          ],
        ).pLTRB(14, 14, 14, 30));
  }
}
