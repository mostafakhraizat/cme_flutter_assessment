import 'package:cme_flutter_assessment/resources/colors.dart';
import 'package:cme_flutter_assessment/ui/authentication/pages/authentication_page.dart';
import 'package:cme_flutter_assessment/ui/home/pages/main_home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        enableScaleText: () => true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            routes: {
              "/home": (context) => const MainHomePage(),
              "/authentication": (context) => const AuthenticationPage(),
            },
            debugShowCheckedModeBanner: false,
            title: 'Bookly',
            theme: ThemeData(
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
              ),
              appBarTheme: const AppBarTheme(elevation: 4),
              scaffoldBackgroundColor: AppColors.primaryBackgroundPrimary,
            ),
            home: const AuthenticationPage(),
          );
        });
  }
}
