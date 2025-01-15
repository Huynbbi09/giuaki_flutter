import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qltv/constant/router.dart';
import 'package:qltv/routers/index.dart';

class ManagerBookScreen extends HookWidget {
  void handleCreateBook() {
    rootNavigatorKey.currentState!.pushNamed(RouterName.createBook);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(),
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
  }
}
