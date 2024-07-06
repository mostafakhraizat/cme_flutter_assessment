import 'package:cme_flutter_assessment/bloc/books/books_bloc.dart';
import 'package:cme_flutter_assessment/data/repository/books_repository.dart';
import 'package:cme_flutter_assessment/data/repository/secure_storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'book_item_widget.dart';

class MainBooksListView extends StatelessWidget {
  const MainBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BlocProvider(
        create: (context) => BooksBloc(
          BooksRepository(),
          SecureStorageRepository(),
        )..add(BooksInitialEvent()),
        child: BlocConsumer<BooksBloc, BooksState>(
          listener: (context, state) {},
          builder: (blocContext, state) {
            if (state is BooksSuccessState) {
              return ReorderableListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ).r,
                onReorder: (oldIndex, newIndex) => blocContext
                    .read<BooksBloc>()
                    .add(BookReOrderEvent(oldIndex, newIndex)),
                children: [
                  ...state.books.map(
                    (book) => BookItem(
                      key: ValueKey(book.title.toString()),
                      item: book,
                    ),
                  )
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
          },
        ),
      ),
    );
  }
}
