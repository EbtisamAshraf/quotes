import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quotes/app.dart';
import 'package:quotes/core/widgets/bloc_observer.dart';
import 'package:quotes/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  BlocOverrides.runZoned(
    () {
      runApp(const QuoteApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
