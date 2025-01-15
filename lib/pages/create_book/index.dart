import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateBookScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final authorController = useTextEditingController();
    final quantityController = useTextEditingController();

    final titleError = useState<String?>(null);
    final descriptionError = useState<String?>(null);
    final authorError = useState<String?>(null);
    final quantityError = useState<String?>(null);

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

      return isValid;
    }

    void submitForm() {
      if (validateForm()) {
        final title = titleController.text;
        final description = descriptionController.text;
        final author = authorController.text;
        final quantity = int.parse(quantityController.text);

        print('Tiêu đề: $title');
        print('Mô tả: $description');
        print('Tác giả: $author');
        print('Số lượng: $quantity');

        titleController.clear();
        descriptionController.clear();
        authorController.clear();
        quantityController.clear();
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
            SizedBox(height: 32.0.sp),
            ElevatedButton(
              onPressed: submitForm,
              child: Text('Thêm Mới'),
            ),
          ],
        ),
      ),
    );
  }
}
