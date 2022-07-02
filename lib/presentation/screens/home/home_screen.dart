import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                                    movie: state.trending![index],
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
                        title: 'Playing Now',
                        items: state.playingNow!,
                      ),
                      CategoryView(
                        title: 'Popular',
                        items: state.popular!,
                      ),
                      CategoryView(
                        title: 'Coming Soon',
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
