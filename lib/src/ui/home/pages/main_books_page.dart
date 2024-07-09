import 'package:cme_flutter_assessment/src/ui/home/widgets/main_books_appbar.dart';
import 'package:cme_flutter_assessment/src/ui/home/widgets/main_books_header.dart';
import 'package:cme_flutter_assessment/src/ui/home/widgets/main_books_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBooksPage extends StatelessWidget {
  const MainBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainBooksAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8).r,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainBooksHeader(),
            MainBooksListView(),
          ],
        ),
      ),
    );
  }
}
