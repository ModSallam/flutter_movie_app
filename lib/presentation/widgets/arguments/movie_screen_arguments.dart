import 'package:movie_app/data/data.dart';

class MovieScreenArguments {
  final int index;
  final List<MovieModel> movies;

  MovieScreenArguments({required this.index, required this.movies});
}
