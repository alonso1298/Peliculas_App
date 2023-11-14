import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier{

  MoviesPovider(){
    print('MoviesProvider inicializado');

    this.getOnDisplayMovies();
  }


  getOnDisplayMovies() async {
    print('getOnDisplayMovies');
  }
  
}