import 'package:flutter/material.dart';
import 'package:test_salma/features/home/presentation/tasks/widget/task_details.dart';

import '../../../../../core/theme/palette.dart';
import '../../../../../core/widgets/text/custom_text.dart';

class TaskDetailsScreen extends StatelessWidget {
  static const String routeName = '/taskDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText.s24(
          "Task Details",
          bold: true,
          color: Palette.appColors.mainColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomText.s24("Today", bold: true),
            Divider(thickness: 2),
            TaskDetails(),
            TaskDetails(),
            TaskDetails(),
          ],
        ),
      ),
    );
  }
}
