import 'package:flutter/material.dart';
import 'package:test_salma/core/theme/palette.dart';
import 'package:test_salma/core/widgets/customTextFormField/customTextformfield.dart';

import '../../../../../core/widgets/buttons/custom_button.dart';
import '../../../../../core/widgets/text/custom_text.dart';
import '../widget/RowRadio.dart';

class PersonalInfo extends StatelessWidget {
  static const String routeName = '/info';
  TextEditingController userName = TextEditingController();
  TextEditingController Id = TextEditingController();
  TextEditingController PhoneNumber = TextEditingController();
  TextEditingController Department = TextEditingController();
  TextEditingController Job = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText.s24(
          "Personal Info",
          bold: true,
          color: Palette.appColors.mainColor,
          center: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              CustomTextFormField(
                label: 'User Name',
                controller: userName,
                hintText: 'Enter Your Name',
              ),
              CustomTextFormField(
                label: 'ID',
                controller: Id,
                hintText: 'Enter Your ID',
              ),
              CustomTextFormField(
                label: 'Phone Name',
                controller: PhoneNumber,
                hintText: 'Enter Your Phone Number',
              ),
              CustomTextFormField(
                label: 'Department',
                controller: Department,
                hintText: 'Enter Your Department',
              ),
              CustomTextFormField(
                label: 'Job',
                controller: Job,
                hintText: 'Enter Your Job',
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15,
                  bottom: 15,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Palette.textColor.thirdTextColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("start Time"),
                            VerticalDivider(thickness: 2, color: Colors.black),
                            Text("End Time"),
                          ],
                        ),
                      ),
                    ),
                    RowRadio(
                      title: 'Gender',
                      optionO: 'Male',
                      optionT: 'Female',
                      initialOption: 'Male',
                    ),
                    RowRadio(
                      title: 'Employment Status',
                      optionO: 'Full-Time',
                      optionT: 'Part-Time',
                      initialOption: 'Full-Time',
                    ),
                    CustomButton(
                      text: "Save",
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          print("All valid, proceed");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
