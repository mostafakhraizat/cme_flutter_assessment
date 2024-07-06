import 'package:cme_flutter_assessment/core/config/firebase_options.dart';
import 'package:cme_flutter_assessment/resources/colors.dart';
import 'package:cme_flutter_assessment/ui/authentication/pages/authentication_page.dart';
import 'package:cme_flutter_assessment/ui/home/pages/main_books_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/dio_config.dart';

void main() async {
  client = Api();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
            themeMode: ThemeMode.dark,
            darkTheme: ThemeData(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.white,
                  size: 24.r,
                ),
                elevation: 0.0,
                centerTitle: true,
                color: AppColors.primaryBackgroundPrimary,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              bottomAppBarTheme: const BottomAppBarTheme(color: Colors.red),
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
              canvasColor: AppColors.primaryBackgroundPrimary,
              scaffoldBackgroundColor: AppColors.primaryBackgroundPrimary,
            ),
            theme: ThemeData(
              iconTheme: const IconThemeData(
                color: AppColors.primaryBackgroundPrimary,
              ),
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: AppColors.primaryBackgroundPrimary,
                  size: 24.r,
                ),
                elevation: 0.0,
                centerTitle: true,
                color: Colors.white,
                titleTextStyle: TextStyle(
                  color: AppColors.primaryBackgroundPrimary,
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              progressIndicatorTheme: const ProgressIndicatorThemeData(
                color: AppColors.primaryBackgroundPrimary,
              ),
              fontFamily: 'OpenSans-Regular',
              indicatorColor: AppColors.primaryBackgroundPrimary,
              textTheme: TextTheme(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryBackgroundPrimary,
                  fontSize: 20.sp,
                ),
                bodyLarge: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
                headlineLarge: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryBackgroundPrimary,
                  fontSize: 18.sp,
                ),
                titleMedium: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryBackgroundPrimary,
                  fontSize: 16.sp,
                ),
                bodyMedium: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryBackgroundPrimary.withOpacity(0.8),
                  fontSize: 13.sp,
                ),
              ),
              canvasColor: Colors.white,
              scaffoldBackgroundColor: Colors.white,
            ),
            home: const AuthenticationPage(),
          );
        });
  }
}
