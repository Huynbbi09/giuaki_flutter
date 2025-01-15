import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManagerBookScreen extends HookWidget {
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
                  onPressed: () {},
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
