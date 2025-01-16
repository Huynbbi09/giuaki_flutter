import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qltv/bloc/book_blob/bloc.dart';
import 'package:qltv/bloc/book_blob/event.dart';

class RootBloc extends MultiBlocProvider {
  final Widget child;

  RootBloc({
    Key? key,
    required this.child,
  }) : super(
          providers: [
            BlocProvider<BookBloc>(
              create: (context) => BookBloc()..add(LoadBooks()),
            ),
          ],
          key: key,
          child: child,
        );
}
