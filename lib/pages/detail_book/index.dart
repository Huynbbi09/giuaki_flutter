import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qltv/bloc/book_blob/bloc.dart';
import 'package:qltv/bloc/book_blob/event.dart';
import 'package:qltv/enity/book.dart';

class DetailBookScreen extends HookWidget {
  final ArgsDetailBook args;

  DetailBookScreen({required this.args});

  @override
  Widget build(BuildContext context) {
    final bookBloc = BlocProvider.of<BookBloc>(context);

    final bookDetail = (bookBloc.state.props as List<Book>).firstWhere(
      (book) => book.id == args.id,
    );

    // Controllers for editing
    final titleController = useTextEditingController(
      text: bookDetail.title,
    );
    final authorController = useTextEditingController(
      text: bookDetail.author,
    );
    final descriptionController = useTextEditingController(
      text: bookDetail.description,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin chi tiết"),
        leadingWidth: 24.0.sp,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: "Tiêu đề",
                    ),
                  ),
                  SizedBox(height: 8.0.sp),
                  TextField(
                    controller: authorController,
                    decoration: InputDecoration(
                      labelText: "Tác giả",
                    ),
                  ),
                  SizedBox(height: 8.0.sp),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: "Mô tả",
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 16.0.sp),
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      bookBloc.add(DeleteBook(bookDetail.id));
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Xóa",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0.sp),
                  ElevatedButton(
                    onPressed: () {
                      // Trigger update event
                      final updatedBook = bookDetail.copyWith(
                        title: titleController.text,
                        author: authorController.text,
                        description: descriptionController.text,
                      );
                      bookBloc.add(UpdateBook(updatedBook));
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8E07C2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Lưu",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArgsDetailBook {
  final int id;

  ArgsDetailBook({required this.id});
}
