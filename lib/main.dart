import 'package:cme_flutter_assessment/core/config/firebase_options.dart';
import 'package:cme_flutter_assessment/resources/styles.dart';
import 'package:cme_flutter_assessment/src/ui/authentication/pages/authentication_page.dart';
import 'package:cme_flutter_assessment/src/ui/home/pages/main_books_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'core/config/dio_config.dart';
import 'core/utils/helper/shared_preferences_helper.dart';

void main() async {
  client = Api();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreferencesHelper()
      .init(); // Initialize sharedpreferences singleton instance
  // SharedPreferencesHelper().remove("sort_actions_graph");
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
          darkTheme: AppThemes.dark,
          theme: AppThemes.light,
          home: const AuthenticationPage(),
        );
      },
    );
  }
}
