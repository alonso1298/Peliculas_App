import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines', style: TextStyle(color: Colors.white),),
        //Esto quita la sombra que tiene por defecto el AppBar
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context, 
              delegate: MovieSearchDelegate()
            ), 
            icon: const Icon( Icons.search_outlined, color: Colors.white, ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            // Tarjetas principales 
            CardSwiper(movies: moviesProvider.onDisplayMovies),

            // Slider de peliculas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
          ],
        ),
      )
    );
  }
}