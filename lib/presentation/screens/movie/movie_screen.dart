import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation.dart';

class MovieScreen extends StatelessWidget {
  final MovieScreenArguments args;

  const MovieScreen({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'FIRE MOVIE',
          style: TextStyle(fontSize: 26.0),
        ),
      ),
      body: Text(args.index.toString()),
    );
  }
}
