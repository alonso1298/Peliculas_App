import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

import 'package:peliculas/providers/movies_provider.dart';

void main() {
  runApp(const AppState());
}


class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => MoviesProvider(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    moviesProvider.getOnDisplayMovies(); // Cargar películas al iniciar MyApp
    moviesProvider.getPopularMovies(); 

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Peliculas ',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => const HomeScreen(),
        'details': ( _ ) => const DetailScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo
        ), 
      ),
    );
  }
}