import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_salma/features/auth/presentation/pages/SignInScreen.dart';
import 'package:test_salma/features/home/presentation/profile/presentation/personal_info.dart';
import 'package:test_salma/features/home/presentation/profile/presentation/privacy_policy.dart';
import 'package:test_salma/features/home/presentation/profile/presentation/reset_password.dart';

import '../../../../../core/theme/palette.dart';
import '../../../../../core/widgets/text/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        centerTitle: true,
        title: CustomText.s24(
          "profile", bold: true,
            color: Palette.appColors.mainColor,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // صورة واسم وتخصص
          const CircleAvatar(
            radius: 55,
            backgroundImage: AssetImage(
              "assets/images/profile.png",
            ), // غيّرها على حسب صورتك
          ),
          const SizedBox(height: 10),
          CustomText.s18(
            "Farida Ahmed", bold: true,
          ),
          CustomText.s14(
            "Full Stack",
            color: Colors.grey,
          ),
          const SizedBox(height: 25),

          // القائمة
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildListTile(
                  context,
                  title: "Personal Info",
                  icon: Icon(
                    Icons.person_outline,
                    color: Palette.appColors.mainColor,
                  ), // ✅ صح
                  onTap: () {
                    Navigator.pushNamed(context, PersonalInfo.routeName);
                  },
                ),

                _buildNotificationTile(),
                _buildLanguageTile(),
                _buildListTile(
                  context,
                  title: "Privacy Policy",
                  icon: SvgPicture.asset(
                    'assets/icons/Component 18 (1).svg',
                    width: 24,
                    height: 24,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, PrivacyPolicy.routeName);
                  },
                ),

                _buildListTile(
                  context,
                  title: "Reset Password",
                  icon: SvgPicture.asset(
                    'assets/icons/hugeicons_reset-password.svg',
                    width: 24,
                    height: 24,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, ResetPassword.routeName);
                  },
                ),

                const SizedBox(height: 20),

                // زر تسجيل الخروج
                GestureDetector(
                  onTap: () {
                    _showLogoutDialog(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Log out",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // عنصر عادي في القائمة
  Widget _buildListTile(BuildContext context, {
    required String title,
    required Widget icon,
    required VoidCallback onTap,
  }) {
    return Card(color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.indigo, width: 1),
      ),
      child: ListTile(
        leading: icon, // هنا بقي يقبل Icon أو SvgPicture.asset
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  // عنصر Notification
  Widget _buildNotificationTile() {
    return Card(color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.indigo, width: 1), // ✅ حواف كحلي
      ),
      child: SwitchListTile(
        activeThumbColor: Palette.appColors.mainColor,
        title: const Text("Notification"),
        value: true,
        onChanged: (value) {},
        secondary: Icon(
          Icons.notifications_outlined,
          color: Palette.appColors.mainColor,
        ),
      ),
    );
  }

  Widget _buildLanguageTile() {
    return Card(color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.indigo, width: 1),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          'assets/icons/Component 18.svg',
          width: 24,
          height: 24,
          color: Palette.appColors.mainColor, // لو عايزة تغيري لون الـ SVG
        ),
        title: const Text("Language"),
        trailing: DropdownButton<String>(
          underline: const SizedBox(),
          value: "English",
          items: const [
            DropdownMenuItem(value: "English", child: Text("English")),
            DropdownMenuItem(value: "Arabic", child: Text("Arabic")),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Palette.appColors.mainColor,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Are you sure you want to log out",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Palette.neutral.color1),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.appColors.mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, SignInscreen.routeName);
                        // ضيف هنا كود تسجيل الخروج
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(color: Palette.neutral.color1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
