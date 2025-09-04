// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:smart_attendance_system/core/theme/palette.dart';
// import 'package:smart_attendance_system/core/widgets/text/custom_text.dart';
//
// class CustomCircularIndicator extends StatelessWidget {
//   CustomCircularIndicator({
//     super.key,
//     required this.percentage,
//     Color? color,
//   }) : color = color ?? Palette.appColors.mainColor;
//
//   final num percentage;
//   final Color color;
//
//   @override
//   Widget build(BuildContext context) {
//     return CircularPercentIndicator(
//       radius: 50.0.r,
//       lineWidth: 12.0.r,
//       percent: percentage / 5,
//       center: CustomText.s30('$percentage', color: color),
//       progressColor: color,
//       backgroundColor: Palette.neutral.color6,
//       backgroundWidth: 11.r,
//       circularStrokeCap: CircularStrokeCap.round,
//     );
//   }
// }
