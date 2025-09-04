import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/palette.dart';
import '../../../../../core/widgets/buttons/custom_button.dart';
import '../../../../../core/widgets/text/custom_text.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Palette.appColors.lightTextBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 16.r,
      // ignore: deprecated_member_use
      shadowColor: Palette.appColors.mainColor.withOpacity(0.5),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 32.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                color: Palette.appColors.mainColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Palette.appColors.mainColor,
                    blurRadius: 4.0,
                    offset: const Offset(1.0, 1.0),
                  ),
                  BoxShadow(
                    color: Palette.appColors.mainColor,
                    blurRadius: 10.0,
                    offset: const Offset(-1.0, -1.0),
                  ),
                ],
              ),
              child: Center(
                child: CustomText.s18(
                  "Clock Out ",
                  bold: true,
                  color: Palette.neutral.color1,
                ),
              ),
            ),
            30.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: 18.r,
                  color: Palette.appColors.mainColor,
                ),
                6.horizontalSpace,
                CustomText.s14(
                  'You are not at work yet',
                  color: Palette.lightGray.lightGray,
                ),
              ],
            ),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.s16(
                      'Start Time',
                      color: Palette.lightGray.lightGray,
                      bold: true,
                    ),
                    CustomText.s13(
                      '00 : 00 AM',
                      color: Palette.lightGray.lightGray,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.s16(
                      'Remaining Time',
                      color: Palette.lightGray.lightGray,
                      bold: true,
                    ),
                    CustomText.s13(
                      '00h : 00m',
                      color: Palette.lightGray.lightGray,
                    ),
                  ],
                ),
              ],
            ),
            16.verticalSpace,
            CustomButton(
              text: "Take a photo",
              isTextBold: true,
              onPressed: () {},
              size: 150,
              isExpanded: false,
            ),
          ],
        ),
      ),
    );
  }
}
