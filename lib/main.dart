import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/core/utils/bloc_observer.dart';
import 'package:movies/style/theme.dart';
import 'package:movies/test.dart';

void main() {
    ServicesLocator().init();
  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      themeMode: ThemeMode.dark,
      home: const TestScreen(),
      );

  }
}
