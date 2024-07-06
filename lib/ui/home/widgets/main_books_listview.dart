import 'package:cme_flutter_assessment/bloc/books/books_bloc.dart';
import 'package:cme_flutter_assessment/data/repository/books_repository.dart';
import 'package:cme_flutter_assessment/data/repository/secure_storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'book_item_widget.dart';
import 'books_error_widget.dart';

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
          listener: (context, state) {
            print(state);
          },
          builder: (blocContext, state) {
            if (state is BooksSuccessState) {
              return RefreshIndicator.adaptive(
                onRefresh: () async {
                  blocContext.read<BooksBloc>().add(BooksInitialEvent());
                },
                child: ReorderableListView(
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
                ),
              );
            } else if (state is BooksErrorState) {
              return BooksErrorWidget(
                reason: state.reason,
                onRetry: () {
                  blocContext.read<BooksBloc>().add(BooksInitialEvent());
                },
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
