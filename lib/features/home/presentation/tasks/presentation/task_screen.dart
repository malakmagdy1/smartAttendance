import 'package:flutter/material.dart';
import 'package:test_salma/core/theme/palette.dart';
import 'package:test_salma/core/widgets/text/custom_text.dart';

import '../widget/task_card.dart';

class TasksScreen extends StatelessWidget {
  static const String routeName = '/task';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText.s24(
          "Tasks",
          bold: true,
          color: Palette.appColors.mainColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomText.s24("Today", bold: true),
            Divider(thickness: 2),
            TaskCard(),
            CustomText.s24("Yesterday", bold: true),
            Divider(thickness: 2),
            TaskCard(),
            CustomText.s24("Last Week", bold: true),
            Divider(thickness: 2),
            TaskCard(),
          ],
        ),
      ),
    );
  }
}
