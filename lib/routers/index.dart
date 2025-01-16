import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qltv/constant/router.dart';
import 'package:qltv/layouts/app_bar/index.dart';
import 'package:qltv/layouts/root/index.dart';
import 'package:qltv/pages/create_book/index.dart';
import 'package:qltv/pages/detail_book/index.dart';
import 'package:qltv/pages/detail_borrow_book_history/index.dart';
import 'package:qltv/pages/null/index.dart';
import 'package:qltv/pages/update_book/index.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class RouterManager {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    HookWidget screen = NullScreen();

    switch (settings.name) {
      case RouterName.createBook:
        screen = CreateBookScreen();
        break;
      case RouterName.updateBook:
        screen = UpdateBookScreen();
        break;
      case RouterName.detailBook:
        screen = DetailBookScreen(args: settings.arguments as ArgsDetailBook);
        break;
      case RouterName.detailBorrowBook:
        screen = DetailBorrowBookHistoryScreen();
      case RouterName.appBar:
        screen = AppBarLayout();
        break;
    }

    return MaterialPageRoute(builder: (context) {
      return RootLayout(
        screen: screen,
      );
    });
  }
}
