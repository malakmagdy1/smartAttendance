import 'package:flutter/material.dart';
import 'package:test_salma/core/widgets/text/custom_text.dart';

import '../../../../../core/theme/palette.dart';
import '../../../../../core/widgets/buttons/custom_button.dart';
import '../../../../../core/widgets/customTextFormField/customTextformfield.dart';
import '../../../../auth/presentation/pages/SignInScreen.dart';

class ResetPassword extends StatefulWidget {
  static const String routeName = '/reset';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController newPass = TextEditingController();

  TextEditingController confirmPass = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText.s24(
          "Reset Password",
          bold: true,
          color: Palette.appColors.mainColor,
          center: true,
        ),
      ),
      body: Form(
        key: _key,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'New Password',
              controller: newPass,
              hintText: 'Enter Your New Password',
              isPassword: !visible,
              validator: (value) =>
                  value!.length < 6 ? "Min 6 characters" : null,
              suffixIcon: tap
                  ? Icons.visibility_off_outlined
                  : Icons.visibility,
              onSuffixTap: () {
                setState(() {
                  tap = !tap;
                  visible = !visible;
                });
              },
            ),
            CustomTextFormField(
              label: 'Confirm Password',
              controller: confirmPass,
              hintText: 'Enter Your New Password',
              isPassword: !visible,
              validator: (value) =>
                  value!.length < 6 ? "Min 6 characters" : null,
              suffixIcon: tap
                  ? Icons.visibility_off_outlined
                  : Icons.visibility,
              onSuffixTap: () {
                setState(() {
                  tap = !tap;
                  visible = !visible;
                });
              },
            ),
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomButton(
                text: "Save",
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    print("All valid, proceed");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
