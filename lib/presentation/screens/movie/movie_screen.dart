import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation.dart';

class MovieScreen extends StatelessWidget {
  final MovieScreenArguments args;

  const MovieScreen({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          args.movie.title,
          style: const TextStyle(fontSize: 26.0),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(args.movie.backdropPathUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  args.movie.title,
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      args.movie.releaseDate,
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${args.movie.voteAverage}',
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade700),
                        ),
                        const SizedBox(width: 4.0),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  children: const [
                    Text(
                      'DESCRIPTION',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                Text(
                  args.movie.overview,
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
