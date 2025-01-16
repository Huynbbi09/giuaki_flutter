import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailBookScreen extends HookWidget {
  final ArgsDetailBook args;

  DetailBookScreen({required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin chi tiết"),
        leadingWidth: 24.0.sp,
      ),
      body: SafeArea(
        child: Container(
          child: Text("Detail ${args.id}"),
        ),
      ),
    );
  }
}

class ArgsDetailBook {
  final int id;

  ArgsDetailBook({required this.id});
}
