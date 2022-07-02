import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/data/data.dart';
import 'package:movie_app/logic/logic.dart';
import 'package:movie_app/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final MovieRepository movieRepository = MovieRepository();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  runApp(MyApp(movieRepository: movieRepository));
}

class MyApp extends StatelessWidget {
  final MovieRepository movieRepository;

  const MyApp({Key? key, required this.movieRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MovieRepository(),
      child: BlocProvider(
        create: (context) =>
            MoviesBloc(movieRepository: movieRepository)..add(GetMovies()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fire Movie',
          theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.amber,
            fontFamily: 'futura',
            scaffoldBackgroundColor: Colors.black,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
