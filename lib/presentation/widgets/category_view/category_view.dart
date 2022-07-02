import 'package:flutter/material.dart';
import 'package:movie_app/data/data.dart';
import 'package:movie_app/presentation/presentation.dart';

class CategoryView extends StatelessWidget {
  final String title;
  final List<MovieModel> items;

  const CategoryView({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20.0),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryScreen(
                      args:
                          CategoryScreenArguments(title: title, movies: items),
                    ),
                  ),
                ),
                child: Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  items.length,
                  (index) => GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieScreen(
                          args: MovieScreenArguments(movie: items[index]),
                        ),
                      ),
                    ),
                    child: Container(
                      width: 140,
                      height: 200,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: NetworkImage(items[index].posterPathUrl),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
