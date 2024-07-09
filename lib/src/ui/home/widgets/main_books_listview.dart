import 'package:cme_flutter_assessment/resources/strings.dart';
import 'package:cme_flutter_assessment/src/bloc/books/books_bloc.dart';
import 'package:cme_flutter_assessment/src/data/model/graph.dart';
import 'package:cme_flutter_assessment/src/data/repository/books_repository.dart';
import 'package:cme_flutter_assessment/src/data/repository/secure_storage_repository.dart';
import 'package:cme_flutter_assessment/src/data/repository/shared_preferences_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
          SharedPreferencesRepository(),
          Graph({}),
        )..add(BooksInitialEvent()),
        child: BlocConsumer<BooksBloc, BooksState>(
          listener: (context, state) {},
          builder: (blocContext, state) {
            if (state is BooksSuccessState) {
              return RefreshIndicator.adaptive(
                onRefresh: () async {
                  blocContext
                      .read<BooksBloc>()
                      .add(BooksRefreshEvent(blocContext));
                },
                child: ReorderableListView(
                  primary: true,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ).r,
                  onReorder: (oldIndex, newIndex) => blocContext
                      .read<BooksBloc>()
                      .add(BookReorderEvent(oldIndex, newIndex)),
                  onReorderStart: (index) {
                    //cancel any older toasts
                    Fluttertoast.cancel();
                    Fluttertoast.showToast(
                      msg: Strings.dragStarted,
                    );
                  },
                  onReorderEnd: (index) {
                    //cancel any older toasts
                    Fluttertoast.cancel();
                    Fluttertoast.showToast(
                      msg: Strings.sortSavedSuccessfully,
                    );
                  },
                  autoScrollerVelocityScalar: 100,
                  footer: const Text(Strings.youAreAllCaughtUp),
                  children: [
                    ...state.books.map(
                      (book) => BookItem(
                        key: ValueKey(book.id.toString()),
                        item: book,
                      ),
                    ),
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
