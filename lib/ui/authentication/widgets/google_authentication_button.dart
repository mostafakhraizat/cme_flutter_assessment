import 'package:cme_flutter_assessment/resources/colors.dart';
import 'package:cme_flutter_assessment/resources/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleAuthenticationButton extends StatelessWidget {
  const GoogleAuthenticationButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32).r,
              color: AppColors.buttonBackgroundColorPrimary,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6).r,
            child: Row(
              children: [
                SvgPicture.asset(
                  AppPath.googleAuthenticationIconPath,
                  height: 24.r,
                  width: 24.r,
                ),
                12.horizontalSpace,
                Text(
                  "Sign in with google",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
