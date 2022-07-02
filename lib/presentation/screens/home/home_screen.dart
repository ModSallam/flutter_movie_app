import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/data.dart';
import 'package:movie_app/logic/logic.dart';
import 'package:movie_app/presentation/presentation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 320,
                  child: PageView.builder(
                    itemCount: state.trending!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ImageContainer(
                            height: 230,
                            image: state.trending![index].posterPathUrl,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieScreen(
                                  args: MovieScreenArguments(
                                    index: index,
                                    movies: state.trending!,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            state.trending![index].title,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22.0,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      CategoryView(
                        title: 'Playing Now Movies',
                        items: state.playingNow!,
                      ),
                      CategoryView(
                        title: 'Popular Movies',
                        items: state.popular!,
                      ),
                      CategoryView(
                        title: 'Coming Soon Movies',
                        items: state.comingSoon!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

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
                          args:
                              MovieScreenArguments(index: index, movies: items),
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

class ImageContainer extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final String image;
  final Function() onTap;

  const ImageContainer({
    Key? key,
    this.width = double.infinity,
    required this.height,
    this.radius = 30,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: NetworkImage(image),
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
    );
  }
}
