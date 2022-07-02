import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryScreenArguments args;

  const CategoryScreen({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          args.title,
          style: const TextStyle(fontSize: 26.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: ListView.builder(
          itemCount: args.movies.length,
          itemBuilder: (context, index) =>
              CategoryCardItem(movie: args.movies[index]),
        ),
      ),
    );
  }
}
