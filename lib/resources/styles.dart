import 'package:flutter/material.dart';
import 'package:cme_flutter_assessment/resources/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {}

class AppThemes {
  static ThemeData get light => ThemeData(
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
        fontFamily: 'Caslon',
        indicatorColor: AppColors.primaryBackground,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.primaryBackgroundDark,
            fontSize: 20.sp,
          ),
          labelMedium: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.primaryBackground,
            fontSize: 14.sp,
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
            color: AppColors.primaryBackgroundDark.withOpacity(0.9),
            fontSize: 13.sp,
          ),
        ),
        canvasColor: Colors.white,
        scaffoldBackgroundColor: AppColors.primaryBackground,
      );
  static ThemeData get dark => ThemeData(
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
            fontFamily: "Caslon",
            color: Colors.white,
            fontSize: 20.0.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.white,
        ),
        fontFamily: 'Caslon',
        indicatorColor: Colors.white,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 20.sp,
          ),
          labelMedium: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.primaryBackgroundDark,
            fontSize: 14.sp,
          ),
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 14.sp,
          ),
          headlineLarge: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 17.sp,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16.sp,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white70,
            fontSize: 13.sp,
          ),
        ),
        canvasColor: AppColors.primaryBackgroundDark,
        scaffoldBackgroundColor: AppColors.primaryBackgroundDark,
      );
}
