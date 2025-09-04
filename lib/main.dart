import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/onbording/onboarding.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/localization/app_localizations.dart';
import 'core/localization/localization_manager.dart';
import 'core/shared_preferences/shared_prefs.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/pages/SignInScreen.dart';
import 'features/auth/presentation/pages/SignUpScreen.dart';
import 'features/auth/presentation/pages/create_newPass_screen.dart';
import 'features/auth/presentation/pages/forgetPass.dart';
import 'features/home/presentation/home/presentation/home_screen.dart';
import 'features/home/presentation/home/presentation/navBar.dart';
import 'features/onbording/splash.dart';

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
    return BlocProvider(
      create: (_) => LocaleCubit(),
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, state) {
          return ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            designSize: const Size(393, 852),
            builder: (context, child) => ToastificationWrapper(
              child: MaterialApp(
                key: ValueKey<String>(state.languageCode), // keeps your key
                debugShowCheckedModeBanner: false,
                title: 'smart_attendance_system',
                theme: AppTheme().theme,
                locale: state,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
// CustomNav.routeName,
                //
                initialRoute:SplashScreen.routeName,
                routes: {
                  SplashScreen.routeName: (context) =>  SplashScreen(),
                  Onboarding.routeName:(context)=>Onboarding(),
                  SignUpscreen.routeName:(context)=>SignUpscreen(),
                  SignInscreen.routeName:(context)=>SignInscreen(),
                  ForgetPass.routeName:(context)=>ForgetPass(),
                  HomeScreen.routeName:(context)=>HomeScreen(),
                  CustomNav.routeName:(context)=>CustomNav(),
                  CreateNewPassScreen.routeName:(context)=>CreateNewPassScreen()
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
