import 'package:flutter/material.dart';
import 'package:movie_app/data/data.dart';

class CategoryCardItem extends StatelessWidget {
  const CategoryCardItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(15, 15),
              blurRadius: 15,
              spreadRadius: 15,
              color: Colors.black45,
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(movie.backdropPathUrl),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(movie.voteAverage.toString()),
                  const SizedBox(width: 4.0),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(movie.releaseDate),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
