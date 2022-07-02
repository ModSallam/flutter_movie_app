import 'package:movie_app/data/data.dart';

class CategoryScreenArguments {
  final String title;
  final List<MovieModel> movies;

  CategoryScreenArguments({required this.title, required this.movies});
}
