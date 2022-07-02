import 'dart:convert';

import 'package:movie_app/data/data.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String apiKey = 'c84985733b461de31d6b2c3d545ca579';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  Future<List<MovieModel>> getTending() async {
    final uri = Uri.parse('${baseUrl}trending/movie/day?api_key=$apiKey');

    final response = await http.get(uri);

    final json = jsonDecode(response.body);

    final MoviesResultModel data = MoviesResultModel.fromMap(json);
    final List<MovieModel> moviesList = data.results!;

    return moviesList;
  }

  Future<List<MovieModel>> getPopular() async {
    final uri = Uri.parse('${baseUrl}movie/popular?api_key=$apiKey');

    final response = await http.get(uri);

    final json = jsonDecode(response.body);

    final MoviesResultModel data = MoviesResultModel.fromMap(json);
    final List<MovieModel> moviesList = data.results!;

    return moviesList;
  }

  Future<List<MovieModel>> getComingSoon() async {
    final uri = Uri.parse('${baseUrl}movie/upcoming?api_key=$apiKey');

    final response = await http.get(uri);

    final json = jsonDecode(response.body);

    final MoviesResultModel data = MoviesResultModel.fromMap(json);
    final List<MovieModel> moviesList = data.results!;

    return moviesList;
  }

  Future<List<MovieModel>> getPlayingNow() async {
    final uri = Uri.parse('${baseUrl}movie/now_playing?api_key=$apiKey');

    final response = await http.get(uri);

    final json = jsonDecode(response.body);

    final MoviesResultModel data = MoviesResultModel.fromMap(json);
    final List<MovieModel> moviesList = data.results!;

    return moviesList;
  }
}
