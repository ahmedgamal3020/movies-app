import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/core/utils/bloc_observer.dart';
import 'package:movies/style/theme.dart';

import 'modules/movies/presentation/screens/movie_screen/movies_screen.dart';

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
      title: "Movies",
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      themeMode: ThemeMode.dark,
      home: const MoviesScreen(),
      );

  }
}
