import 'package:flutter/material.dart';
import '../../../../../core/theme/palette.dart';
import '../../../../../core/widgets/buttons/custom_button.dart';
import '../../../../../core/widgets/customTextFormField/customTextformfield.dart';
import '../../../../../core/widgets/text/custom_text.dart';
import '../widget/appBarFloating.dart';
import 'SignInScreen.dart';

class CreateNewPassScreen extends StatefulWidget {
  static const String routeName = "/CreateNewPassScreen";

  const CreateNewPassScreen({super.key});

  @override
  State<CreateNewPassScreen> createState() => _CreateNewPassScreenState();
}

class _CreateNewPassScreenState extends State<CreateNewPassScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController conformPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final height = mediaQuery.height;
    final width = mediaQuery.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              const AppBarFloating("Create New Password", SignInscreen.routeName),
              SizedBox(height: height * 0.03),
              Image.asset(
                "assets/images/Logo.png",
                height: height * 0.2,
                width: width * 0.4,
                fit: BoxFit.contain,
              ),
              SizedBox(height: height * 0.1),
             
                Center(
                  child: CustomText.s14(
                    "You new password must be different from previously used password",
                    color: Palette.textColor.secondTextColor,
                  ),
                
              ),
              SizedBox(height: height * 0.02),
              CustomTextFormField(
                label: "Username",
                hintText: "Enter your name",
                controller: nameController,
                keyboardType: TextInputType.name,
                validator: (value) =>
                    value!.isEmpty ? "Name is required" : null,
              ),
              CustomTextFormField(
                label: "Confirm Password",
                hintText: "Confirm your Password",
                controller: conformPasswordController,
                isPassword: visible,
                validator: (value) =>
                    value!.length < 6 ? "Min 6 characters" : null,
                suffixIcon:
                    tap ? Icons.visibility_off_outlined : Icons.visibility,
                onSuffixTap: () {
                  setState(() {
                    tap = !tap;
                    visible = !visible;
                  });
                },
              ),
              SizedBox(height: height * 0.05),
              CustomButton(
                  text: "Save",
                  onPressed: () {
                    Verify(context);
                  })
            ],
          ),
        ),
      ),
    ));
  }

  void Verify(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final height = mediaQuery.height;
    //final width = mediaQuery.width;
    showDialog(
      context: context,
      barrierDismissible: false, // prevents tapping outside to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText.s20(
                "Verified",
                color: Palette.appColors.mainColor,
              ),
              SizedBox(height: height * 0.05),
              CustomText.s14(
                "Your account has been verified successfully",
                color: Palette.textColor.secondTextColor,
              ),  SizedBox(height: height * 0.04),
              CustomButton(text: "Save", onPressed:(){Navigator.of(context).pop();})
            ],
          ),
        );
      },
    );
  }


}
