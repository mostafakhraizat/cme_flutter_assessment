import 'package:cached_network_image/cached_network_image.dart';
import 'package:cme_flutter_assessment/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookImageWidget extends StatelessWidget {
  const BookImageWidget({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6).r,
      child: CachedNetworkImage(
        errorWidget: (context, url, error) {
          return Container(
            color: AppColors.imageErrorBackground,
            child: Icon(Icons.image),
          );
        },
        placeholder: (context, url) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              strokeWidth: 1,
            ),
          );
        },
        width: 80.w,
        height: 100.h,
        fit: BoxFit.cover,
        imageUrl: url,
      ),
    );
  }
}
