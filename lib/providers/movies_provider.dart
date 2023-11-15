import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{

  final String _apyKey   = 'ac633540fcbb72704adff20bc4e83937';
  final String _baseUrl  = 'api.themoviedb.org';
  final String _languaje = 'es-ES';


  MoviesPovider(){
    print('MoviesProvider inicializado');

    this.getOnDisplayMovies();
  }


  getOnDisplayMovies() async {
    var url = Uri.https( _baseUrl, '3/movie/now_playing', {
      'api_key' : _apyKey,
      'languaje': _languaje, 
      'page'    : '1',
    });

    // Espera la respuesta http get y luego decodifique la respuesta con formato json.
    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode( response.body );
    print( decodeData['dates'] );
  }
  
}