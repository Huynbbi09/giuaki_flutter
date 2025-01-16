import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qltv/bloc/book_blob/bloc.dart';
import 'package:qltv/bloc/book_blob/state.dart';
import 'package:qltv/constant/router.dart';
import 'package:qltv/enity/book.dart';
import 'package:qltv/pages/manager_book/book.dart';
import 'package:qltv/routers/index.dart';

class ManagerBookScreen extends HookWidget {
  void handleCreateBook() {
    rootNavigatorKey.currentState!.pushNamed(RouterName.createBook);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<BookBloc, BookState>(builder: (context, state) {
      final listBook = List<Book>.from(state.props);

      return Container(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0.sp),
                  itemCount: listBook.length,
                  itemBuilder: (context, index) {
                    final book = listBook[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8.0.sp),
                      child: BookComponent(book: book),
                    );
                  },
                ),
              ),
              Container(
                width: screenWidth,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: ElevatedButton(
                    onPressed: handleCreateBook,
                    child: Text("Thêm mới"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0.sp),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
