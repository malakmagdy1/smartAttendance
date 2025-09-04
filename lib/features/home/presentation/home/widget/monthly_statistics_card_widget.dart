import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/palette.dart';
import '../../../../../core/widgets/progress/custom_circular_indicator.dart';
import '../../../../../core/widgets/text/custom_text.dart';
class MonthlyStatisticsCardWidget extends StatelessWidget {
  final int percentage;
  final String title;
  final String description;
  final Color? color;

  const MonthlyStatisticsCardWidget({
    super.key,
    required this.percentage,
    required this.title,
    required this.description,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // CustomCircularIndicator(
        //   percentage: percentage,
        //   color: color,
        // ),
        10.verticalSpace,
        CustomText.s18(
          title,
          color: Palette.textColor.mainTextColor,
          bold: true,
        ),
        4.verticalSpace,
        CustomText.s12(
          description,
          color: Palette.textColor.secondTextColor,
        ),
      ],
    );
  }
}
