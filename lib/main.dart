import 'dart:collection';

import 'package:cme_flutter_assessment/core/config/firebase_options.dart';
import 'package:cme_flutter_assessment/resources/colors.dart';
import 'package:cme_flutter_assessment/ui/authentication/pages/authentication_page.dart';
import 'package:cme_flutter_assessment/ui/home/pages/main_books_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/dio_config.dart';
import 'core/utils/helper/shared_preferences_helper.dart';

void main() async {
  client = Api();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreferencesHelper().init(); // Initialize the singleton instance

  runApp(const MyApp());
}

late Api client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        enableScaleText: () => true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            routes: {
              "/home": (context) => const MainBooksPage(),
              "/authentication": (context) => const AuthenticationPage(),
            },
            debugShowCheckedModeBanner: false,
            title: 'Bookly',
            themeMode: ThemeMode.system,
            darkTheme: ThemeData(
              cardTheme: const CardTheme(color: AppColors.buttonBackgroundDark),
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              appBarTheme: AppBarTheme(
                backgroundColor: AppColors.primaryBackgroundDark,
                iconTheme: IconThemeData(
                  color: Colors.white,
                  size: 24.r,
                ),
                elevation: 0.0,
                centerTitle: true,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              progressIndicatorTheme: const ProgressIndicatorThemeData(
                color: Colors.white,
              ),
              fontFamily: 'OpenSans-Regular',
              indicatorColor: Colors.white,
              textTheme: TextTheme(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
                bodyLarge: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
                headlineLarge: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
                titleMedium: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
                bodyMedium: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white60,
                  fontSize: 13.sp,
                ),
              ),
              canvasColor: AppColors.primaryBackgroundDark,
              scaffoldBackgroundColor: AppColors.primaryBackgroundDark,
            ),
            theme: ThemeData(
              cardTheme: const CardTheme(color: AppColors.buttonBackground),
              iconTheme: const IconThemeData(
                color: AppColors.primaryBackgroundDark,
              ),
              appBarTheme: AppBarTheme(
                backgroundColor: AppColors.primaryBackground,
                iconTheme: IconThemeData(
                  color: AppColors.primaryBackgroundDark,
                  size: 24.r,
                ),
                elevation: 0.0,
                centerTitle: true,
                titleTextStyle: TextStyle(
                  color: AppColors.primaryBackgroundDark,
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              progressIndicatorTheme: const ProgressIndicatorThemeData(
                color: AppColors.primaryBackgroundDark,
              ),
              fontFamily: 'OpenSans-Regular',
              indicatorColor: AppColors.primaryBackground,
              textTheme: TextTheme(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryBackgroundDark,
                  fontSize: 20.sp,
                ),
                bodyLarge: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
                headlineLarge: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryBackgroundDark,
                  fontSize: 18.sp,
                ),
                titleMedium: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryBackgroundDark,
                  fontSize: 16.sp,
                ),
                bodyMedium: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryBackgroundDark.withOpacity(0.8),
                  fontSize: 13.sp,
                ),
              ),
              canvasColor: Colors.white,
              scaffoldBackgroundColor: AppColors.primaryBackground,
            ),
            home: const AuthenticationPage(),
          );
        });
  }
}
