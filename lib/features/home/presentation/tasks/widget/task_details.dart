import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_salma/core/theme/palette.dart';
import 'package:test_salma/core/widgets/text/custom_text.dart';

import '../../../../../core/widgets/buttons/customButtonIcon.dart';

class TaskDetails extends StatelessWidget {
  static const String routeName = '/taskDetails';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Palette.appColors.mainColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CustomRow("Task 1", "Implement User Authentication"),
              CustomRow("Due Date : ", "1 - July - 2025"),
              CustomRow("Note:", "None"),
              Custombuttonicon(),
            ],
          ),
        ),
      ),
    );
  }

  CustomRow(title, subtitle) {
    return Row(
      children: [
        CustomText.s16(
          title,
          bold: true,
          color: Palette.textColor.secondTextColor,
        ),
        CustomText.s16(subtitle),
      ],
    );
  }
}
