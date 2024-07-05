import 'package:cme_flutter_assessment/resources/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AuthenticationLogo extends StatelessWidget {
  const AuthenticationLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset(
          AppPath.appIconPath,
          height: 72.r,
          width: 72.r,
        ),
        Text(
          'Bookly',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
