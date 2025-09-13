import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_salma/features/home/presentation/profile/presentation/profile_screen.dart';
import 'package:toastification/toastification.dart';

import 'core/shared_preferences/shared_prefs.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/pages/SignInScreen.dart';
import 'features/auth/presentation/pages/SignUpScreen.dart';
import 'features/auth/presentation/pages/create_newpass_screen.dart';
import 'features/auth/presentation/pages/forgetPass.dart';
import 'features/auth/presentation/pages/verify.dart';
import 'features/home/presentation/home/presentation/home_screen.dart';
import 'features/home/presentation/home/presentation/navBar.dart';
import 'features/home/presentation/notification/presentation/notification_screen.dart';
import 'features/home/presentation/profile/presentation/personal_info.dart';
import 'features/home/presentation/profile/presentation/privacy_policy.dart';
import 'features/home/presentation/profile/presentation/reset_password.dart';
import 'features/home/presentation/tasks/presentation/task_details_screen.dart';
import 'features/home/presentation/tasks/presentation/task_screen.dart';
import 'features/home/presentation/tasks/widget/task_details.dart';
import 'features/onbording/splash.dart';
import 'features/onbording/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // تحميل SharedPreferences و FlutterSecureStorage
  final prefs = await SharedPreferences.getInstance();
  const secure = FlutterSecureStorage();

  final sharedPrefs = SharedPrefs(prefs, secure);

  runApp(MyApp(sharedPrefs: sharedPrefs));
}
class MyApp extends StatelessWidget {
  final SharedPrefs sharedPrefs;

  const MyApp({super.key, required this.sharedPrefs});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(393, 852),
      builder: (context, child) => ToastificationWrapper(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'smart_attendance_system',
          theme: AppTheme().theme,
          initialRoute: CustomNav.routeName,
          routes: {
            NotificationScreen.routeName: (context) => NotificationScreen(),
            SplashScreen.routeName: (context) => const SplashScreen(),
            Onboarding.routeName: (context) => const Onboarding(),
            SignUpscreen.routeName: (context) => const SignUpscreen(),
            SignInscreen.routeName: (context) => const SignInscreen(),
            ForgetPass.routeName: (context) => const ForgetPass(),
            VerifyScreen.routeName: (context) => const VerifyScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            CustomNav.routeName: (context) => const CustomNav(),
            CreateNewPassScreen.routeName: (context) => const CreateNewPassScreen(),
            PrivacyPolicy.routeName: (context) => PrivacyPolicy(),
            ResetPassword.routeName: (context) => ResetPassword(),
            PersonalInfo.routeName: (context) => PersonalInfo(),
            TasksScreen.routeName: (context) => TasksScreen(),
            TaskDetailsScreen.routeName: (context) => TaskDetailsScreen(),
          },
        ),
      ),
    );
  }
}


