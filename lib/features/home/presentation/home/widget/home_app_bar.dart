import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/palette.dart';
import '../../../../../core/widgets/text/custom_text.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 28.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // CustomImage.circular(
          //   radius: 70.r,
          // ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText.s18(
                  'Hello, Farida',
                  color: Palette.appColors.mainColor,
                  bold: true,
                ),
                CustomText.s14(
                  'Full Stack',
                  color: Palette.textColor.secondTextColor,
                  bold: true,
                ),
                Row(children: [
                  Icon(Icons.access_time,
                      size: 12.r, color: Palette.textColor.secondTextColor),
                  CustomText.s12(
                    ' 09:00 AM ',
                    color: Palette.textColor.secondTextColor,
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: 12.r, color: Palette.textColor.secondTextColor),
                  CustomText.s12(
                    ' 05:00 PM ',
                    color: Palette.textColor.secondTextColor,
                  ),
                ]),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.task,
                  size: 28.r,
                  color: Palette.appColors.mainColor,
                ),
              ),
              5.horizontalSpace,
              InkWell(
                onTap: () {},
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      Icons.notifications,
                      size: 28.r,
                      color: Palette.appColors.mainColor,
                    ),
                    Positioned(
                      top: 4,
                      right: 2,
                      child: Container(
                        width: 11.r,
                        height: 11.r,
                        decoration: BoxDecoration(
                          color: Palette.appColors.errorColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Palette.neutral.color1, width: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
