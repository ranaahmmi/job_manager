import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_manager/data/riverpod/jobs_notifier_provider.dart';
import 'package:job_manager/helper/loader.dart';
import 'package:job_manager/helper/page_navigation_animation.dart';
import 'package:job_manager/screens/job_detail_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:job_manager/data/models/job_model.dart';
import 'package:job_manager/helper/constants.dart';
import 'package:job_manager/helper/custom_card.dart';

class JobsScreen extends ConsumerStatefulWidget {
  const JobsScreen({
    Key? key,
  }) : super(key: key);
  @override
  ConsumerState<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends ConsumerState<JobsScreen> {
  String dropdownValue = 'Today';
  @override
  Widget build(BuildContext context) {
    final jobListProvider = ref.watch(jobListNotifierProvider);

    return Scaffold(
      body: jobListProvider is JobsLoadedState
          ? ListView(
              padding: EdgeInsets.zero,
              children: [
                AppHeader(
                    title: "Jobs",
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.keyboard_arrow_down,
                          size: 20, color: context.colors.primary),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: context.colors.primary, fontSize: 15),
                      underline: const SizedBox(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        'Today',
                        'Yesterday',
                        '1 week',
                        '1 months'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                padding2x,
                ListView.builder(
                  itemCount: jobListProvider.jobsList?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return JobCard(
                      isSelected: index == 0 ? true : false,
                      job: jobListProvider.jobsList![index],
                    ).pOnly(bottom: 25);
                  },
                )
              ],
            ).px(20)
          : jobListProvider is JobsLoadingState
              ? const AppLoader(
                  size: 50,
                )
              : jobListProvider is JobsErrorState
                  ? Text(jobListProvider.message)
                  : Container(),
    );
  }
}

class AppHeader extends StatelessWidget {
  final String title;
  final Widget child;
  const AppHeader({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        defaultPadding,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [title.headingText(context, 15), child],
        ),
      ],
    );
  }
}

class JobCard extends StatelessWidget {
  final JobModel job;
  final bool isSelected;
  const JobCard({
    Key? key,
    required this.job,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Vx.log(job.toJson());
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
                    (DateTime.parse(job.scheduledOn ?? "2022-12-05T23:00:00Z")
                            .timeAgo())
                        .text
                        .color(context.colors.primary)
                        .size(11)
                        .make(),
                    (job.durationHours ?? "durationHours")
                        .text
                        .color(context.colors.primary)
                        .size(11)
                        .make(),
                  ],
                ),
                padding1x,
                (job.jobTemplateName ?? '')
                    .headingText(context, 15)
                    .text
                    .color(context.colors.primary)
                    .make(),
                padding2x,
                (job.description ?? "")
                    .headingText(context, 12)
                    .text
                    .color(
                        isSelected ? Colors.white : context.titleLarge!.color)
                    .make()
                    .pOnly(right: 120),
                padding1x,
                (job.address ?? "")
                    .txt(context, 12)
                    .text
                    .color(
                        isSelected ? Colors.white : context.titleLarge!.color)
                    .make(),
              ],
            ).pLTRB(14, 14, 14, 30))
        .onTap(() {
      Navigator.push(
          context,
          SlideRightRoute(
              page: JobDetailScreen(
            job: job,
          )));
    });
  }
}
