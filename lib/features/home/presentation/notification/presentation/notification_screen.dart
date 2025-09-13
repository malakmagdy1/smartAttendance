import 'package:flutter/material.dart';

import '../../../../../core/theme/palette.dart';
import '../../../../../core/widgets/text/custom_text.dart';
import '../widget/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = '/notifi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText.s24(
          "Notification",
          bold: true,
          color: Palette.appColors.mainColor,
        ),
      ),
      body: Column(
        children: [
          NotifiWidget(
            title: 'Request status updated: Pending → Approved',
            imagePath: 'assets/icons/lsicon_order-edit-filled.svg',
            trailText: "4 - Jun ",
          ),
          NotifiWidget(
            title: ' Attendance recorded successfully. Have a productive day!',
            imagePath: 'assets/icons/lsicon_order-edit-filled.svg',
            trailText: "4 - Jun ",
          ),
          NotifiWidget(
            title: 'Don\'t forget to check in!',
            imagePath: 'assets/icons/Subtract.svg',
            trailText: "4 - Jun ",
          ),
        ],
      ),
    );
  }
}
