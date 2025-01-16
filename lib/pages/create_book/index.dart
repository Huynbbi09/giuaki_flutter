import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qltv/bloc/book_blob/bloc.dart';
import 'package:qltv/bloc/book_blob/event.dart';
import 'package:qltv/enity/book.dart';
import 'package:qltv/routers/index.dart';

class CreateBookScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final authorController = useTextEditingController();
    final quantityController = useTextEditingController();
    final selectedCategory = useState<String?>(null);

    final titleError = useState<String?>(null);
    final descriptionError = useState<String?>(null);
    final authorError = useState<String?>(null);
    final quantityError = useState<String?>(null);
    final categoryError = useState<String?>(null);

    final bookBloc = BlocProvider.of<BookBloc>(context);

    bool validateForm() {
      bool isValid = true;

      if (titleController.text.isEmpty) {
        titleError.value = "Vui lòng nhập tiêu đề sách";
        isValid = false;
      } else {
        titleError.value = null;
      }

      if (descriptionController.text.isEmpty) {
        descriptionError.value = "Vui lòng nhập mô tả sách";
        isValid = false;
      } else {
        descriptionError.value = null;
      }

      if (authorController.text.isEmpty) {
        authorError.value = "Vui lòng nhập tên tác giả";
        isValid = false;
      } else {
        authorError.value = null;
      }

      if (quantityController.text.isEmpty ||
          int.tryParse(quantityController.text) == null) {
        quantityError.value = "Vui lòng nhập số lượng hợp lệ";
        isValid = false;
      } else {
        quantityError.value = null;
      }

      if (selectedCategory.value == null) {
        categoryError.value = "Vui lòng chọn loại sách";
        isValid = false;
      } else {
        categoryError.value = null;
      }

      return isValid;
    }

    void submitForm() {
      if (validateForm()) {
        final title = titleController.text;
        final description = descriptionController.text;
        final author = authorController.text;
        final quantity = int.parse(quantityController.text);
        // final category = selectedCategory.value!;

        bookBloc.add(AddBook(Book(
          id: 0,
          title: title,
          description: description,
          author: author,
          quantity: quantity,
          // category: category,
        )));

        titleController.clear();
        descriptionController.clear();
        authorController.clear();
        quantityController.clear();
        selectedCategory.value = null;

        rootNavigatorKey.currentState!.pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm Mới Sách"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Tiêu đề',
                      hintText: 'Nhập tiêu đề sách',
                      errorText: titleError.value,
                    ),
                  ),
                  SizedBox(height: 16.0.sp),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Mô tả',
                      hintText: 'Nhập mô tả sách',
                      errorText: descriptionError.value,
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 16.0.sp),
                  TextField(
                    controller: authorController,
                    decoration: InputDecoration(
                      labelText: 'Tác giả',
                      hintText: 'Nhập tên tác giả',
                      errorText: authorError.value,
                    ),
                  ),
                  SizedBox(height: 16.0.sp),
                  TextField(
                    controller: quantityController,
                    decoration: InputDecoration(
                      labelText: 'Số lượng',
                      hintText: 'Nhập số lượng sách',
                      errorText: quantityError.value,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16.0.sp),
                  DropdownButtonFormField<String>(
                    value: selectedCategory.value,
                    items: [
                      DropdownMenuItem(
                          value: 'Khoa học', child: Text('Khoa học')),
                      DropdownMenuItem(
                          value: 'Tiểu thuyết', child: Text('Tiểu thuyết')),
                      DropdownMenuItem(
                          value: 'Lịch sử', child: Text('Lịch sử')),
                      DropdownMenuItem(value: 'Khác', child: Text('Khác')),
                    ],
                    onChanged: (value) {
                      selectedCategory.value = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Loại sách',
                      errorText: categoryError.value,
                    ),
                  ),
                  SizedBox(height: 32.0.sp),
                ],
              ),
            ),
            Container(
              width: width,
              child: ElevatedButton(
                onPressed: submitForm,
                child: Text('Thêm Mới'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
