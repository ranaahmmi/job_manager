import 'package:flutter/material.dart';
import 'package:job_manager/helper/style.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';
import 'dart:io' show Platform;

const String defaultProfilePicUrl =
    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
const Duration appDuration = Duration(milliseconds: 800);
const HeightBox formFieldHeightPadding = HeightBox(15);
const HeightBox padding3x = HeightBox(30);
const HeightBox padding2x = HeightBox(20);
const HeightBox padding1x = HeightBox(10);
const HeightBox padding5x = HeightBox(50);
const HeightBox defaultPadding = HeightBox(20);
const double defaultBorderRadius = 12.0;
const double defaultBorderRadiusLr = 20.0;
const double defaultBorderRadiusSm = 8.0;

class Constants {
  List<String> generateRowOfMonths() {
    List<String> months = [];
    for (int i = 1; i <= 12; i++) {
      DateTime dateTime = DateTime(DateTime.now().year, i, 1);
      months.add(
        DateFormat('MMM').format(dateTime),
      );
    }
    return months;
  }

  List<int> generateListOfYear() {
    int from = 1990;
    int to = DateTime.now().year + 1;
    return List<int>.generate(to - from, (index) {
      return from++;
    }).sortedBy(
      (a, b) => b.compareTo(a),
    );
  }

  String getDeviceType() {
    return Platform.isIOS ? 'ios' : 'android';
  }

  void showErrorTost(BuildContext context, String error,
      {Color bgColor = Colors.red}) {
    context.showToast(
        position: VxToastPosition.top,
        bgColor: bgColor.withOpacity(0.9),
        textColor: Colors.white,
        textSize: 14,
        msg: error);
  }

  Widget error(String e) {
    return Center(child: 'Error: $e'.text.center.red600.makeCentered());
  }

  InputDecoration appInputDecoration(
      BuildContext context, String hint, Color color,
      {IconData? icon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: AppColors.grey, fontSize: 14),
      prefixIcon: icon != null
          ? Icon(
              icon,
              color: context.primaryColor,
            )
          : null,
      // filled: true,
      // fillColor: Colors.white,
      errorStyle: const TextStyle(fontSize: 10, height: 0.5),
      // Enabled Border
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey),
      ),
      // Focused Border
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: context.primaryColor, width: 2),
      ),
      // Error Border
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: context.primaryColor, width: 1),
      ),
      // Focused Error Border
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
    );
  }
}

// class ShimmerLoading {
//   Widget homeLoading() {
//     return Shimmer.fromColors(
//       baseColor: const Color.fromARGB(255, 221, 220, 220),
//       highlightColor: const Color.fromARGB(255, 245, 240, 240),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           40.heightBox,
//           ShimmerTitle(),
//           20.heightBox,
//           ShimmerRowWidget().h(200),
//           20.heightBox,
//           ShimmerTitle(),
//           10.heightBox,
//           Wrap(
//             crossAxisAlignment: WrapCrossAlignment.center,
//             spacing: 15.0,
//             runSpacing: 10.0,
//             children: [
//               for (int i = 0; i < 10; i++)
//                 Container(
//                   width: 60,
//                   height: 60.0,
//                   color: const Color.fromARGB(118, 255, 255, 255),
//                 ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
// class ShimmerRowWidget extends StatelessWidget {
//   const ShimmerRowWidget({
//     Key? key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             width: 190.0,
//             height: 200.0,
//             color: const Color.fromARGB(118, 255, 255, 255),
//           ),
//           20.widthBox,
//           Container(
//             width: 190.0,
//             height: 200.0,
//             color: const Color.fromARGB(118, 255, 255, 255),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class ShimmerTitle extends StatelessWidget {
//   const ShimmerTitle({
//     Key? key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Container(
//           width: double.infinity,
//           height: 8.0,
//           color: const Color.fromARGB(118, 255, 255, 255),
//         ),
//         const Padding(
//           padding: EdgeInsets.symmetric(vertical: 2.0),
//         ),
//         Container(
//           width: double.infinity,
//           height: 8.0,
//           color: const Color.fromARGB(118, 255, 255, 255),
//         ),
//         const Padding(
//           padding: EdgeInsets.symmetric(vertical: 2.0),
//         ),
//         Container(
//           width: 40.0,
//           height: 8.0,
//           color: const Color.fromARGB(118, 255, 255, 255),
//         ),
//       ],
//     );
//   }
// }