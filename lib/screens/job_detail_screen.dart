import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_manager/data/models/job_model.dart';
import 'package:job_manager/helper/app_buttons.dart';
import 'package:job_manager/helper/app_icons_icons.dart';
import 'package:job_manager/helper/constants.dart';
import 'package:job_manager/helper/custom_card.dart';
import 'package:job_manager/helper/style.dart';
import 'package:job_manager/screens/job_report_screen.dart';

import 'package:velocity_x/velocity_x.dart';

class JobDetailScreen extends ConsumerWidget {
  const JobDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: ColoredBox(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(70),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    // boxShadow: [AppColors.shadow],
                  ),
                  width: context.screenWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      TabBar(
                        unselectedLabelColor: context.colors.primary,
                        labelColor: context.colors.primary,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        indicatorWeight: 5,
                        indicatorColor: context.colors.secondary,
                        labelStyle: context.headlineLarge!.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 14),
                        unselectedLabelStyle: context.headlineLarge!.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 14),
                        tabs: const [Text("Job Detail"), Text("Report")],
                      ).h(50),
                    ],
                  ),
                ),
              ),
              body: Stack(
                children: [
                  TabBarView(
                    children: <Widget>[
                      JobDetail(jobs: JobModel()),
                      JobReportScreen(jobs: JobModel())
                    ],
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppCustomButtonWithChild(
                            height: 40,
                            elevation: 3,
                            radius: 8,
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.pause,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                5.widthBox,
                                "Pause".headingText(context, 12,
                                    color: Colors.white),
                              ],
                            ).px(30),
                          ),
                          30.widthBox,
                          AppCustomButtonWithChild(
                            color: context.colors.secondary,
                            height: 40,
                            elevation: 3,
                            radius: 8,
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.check,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                5.widthBox,
                                "Finish".headingText(context, 12,
                                    color: Colors.white),
                              ],
                            ).px(30),
                          ),
                        ],
                      ))
                ],
              )),
        ),
      ),
    );
  }
}

class JobDetail extends ConsumerStatefulWidget {
  final JobModel jobs;

  const JobDetail({Key? key, required this.jobs}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _JobReportScreenState();
}

class _JobReportScreenState extends ConsumerState<JobDetail> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const JobDetailHeader(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            JobDetailInformationCard(
              title: "Address",
              description: "Lorem ipsum dolor sit amet, consetetur sadipscing ",
              buttonTitle: "See Map",
              icon: Icon(
                AppIcons.map_1,
                size: 11,
                color: context.colors.secondary,
              ),
            ),
            const JobDetailInformationCard(
                title: "Clint",
                description:
                    "Lorem ipsum dolor sit amet, consetetur sadipscing ",
                buttonTitle: "+9234674554",
                icon: Icon(
                  AppIcons.phone,
                  size: 11,
                  color: Colors.green,
                )),
            padding3x,
            "Fix a leakage manually "
                .headingText(context, 14, color: context.colors.primary),
            padding2x,
            Image.asset(
              "assets/images/emptyImage.png",
              height: 45,
            )
          ],
        ).px(20),
      ],
    );
  }
}

class JobDetailInformationCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonTitle;
  final Icon icon;
  const JobDetailInformationCard({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonTitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        padding3x,
        title.headingText(context, 14, color: context.colors.primary),
        padding1x,
        description.txt(context, 12),
        padding3x,
        AppCustomButtonWithChild(
          height: 30,
          elevation: 3,
          radius: 8,
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              5.widthBox,
              buttonTitle.txt(context, 9, color: Colors.white),
            ],
          ).px(10),
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

class JobDetailHeader extends StatelessWidget {
  const JobDetailHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        color: context.colors.primary,
        isShadow: true,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Fix a leakage"
                          .headingText(context, 16, color: Colors.white),
                      20.heightBox,
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod "
                          .txt(context, 12, color: Colors.white),
                    ],
                  ).pOnly(right: 10),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        AppIcons.time,
                        color: context.colors.secondary,
                        size: 16,
                      ).pOnly(top: 3),
                      5.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          "11th November 16:00 - 19:00"
                              .txt(context, 12, color: Colors.white)
                              .w(100),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: "job id  #123 ".txt(context, 11, color: AppColors.grey),
            )
          ],
        ).p(20));
  }
}
