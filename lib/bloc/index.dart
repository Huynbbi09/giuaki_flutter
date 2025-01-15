import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qltv/bloc/auth_bloc/state.dart';

class RootBloc extends MultiBlocProvider {
  final Widget child;

  RootBloc({
    Key? key,
    required this.child,
  }) : super(
          providers: [
            BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
          ],
          key: key,
          child: child,
        );
}
