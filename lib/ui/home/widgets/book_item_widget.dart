import 'package:cme_flutter_assessment/model/book.dart';
import 'package:cme_flutter_assessment/resources/colors.dart';
import 'package:cme_flutter_assessment/ui/home/widgets/book_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.item});
  final Book item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookImageWidget(
            url: item.imageUrl,
          ),
          12.horizontalSpace,
          Expanded(
            // Constrain the width of the title column
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  item.author,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const Icon(
            Icons.drag_handle,
            color: AppColors.actionIconColor,
          )
        ],
      ),
    );
  }
}
