import 'package:cme_flutter_assessment/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksErrorWidget extends StatelessWidget {
  const BooksErrorWidget({
    super.key,
    required this.reason,
    required this.onRetry,
  });
  final String reason;
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          reason,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        14.verticalSpace,
        InkWell(
          onTap: onRetry,
          child: Container(
            width: 142.w,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3).r,
              color: Theme.of(context).iconTheme.color,
            ),
            child: Center(
              child: Text(
                Strings.tryAgain,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        )
      ],
    );
  }
}
