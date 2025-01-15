import 'package:flutter/material.dart';
import 'package:qltv/constant/router.dart';
import 'package:qltv/routers/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Navigator(
            key: rootNavigatorKey,
            initialRoute: RouterName.appBar,
            onGenerateRoute: (settings) {
              return RouterManager.onGenerateRoute(settings);
            },
          ),
        );
      },
    );
  }
}
