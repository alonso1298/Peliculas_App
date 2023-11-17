
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {

  final String _apiKey   = 'ac633540fcbb72704adff20bc4e83937';
  final String _baseUrl  = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesPovider() {
    print('MoviesProvider inicializado');

    getOnDisplayMovies();
  }


  getOnDisplayMovies() async {
    var url = Uri.https( _baseUrl, '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language': _language, 
      'page'    : '1'
    });

    // Espera la respuesta http get y luego decodifique la respuesta con formato json.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }
  
}