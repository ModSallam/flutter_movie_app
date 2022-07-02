import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/data.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MovieRepository _movieRepository;

  MoviesBloc({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(const MoviesInitial()) {
    on<GetMovies>(_onGetMovies);
  }

  Future<void> _onGetMovies(GetMovies event, Emitter<MoviesState> emit) async {
    emit(MoviesLoading(
      trending: state.trending,
      popular: state.popular,
      playingNow: state.playingNow,
      comingSoon: state.comingSoon,
    ));

    final List<MovieModel> trending = await _movieRepository.getTending();
    final List<MovieModel> popular = await _movieRepository.getPopular();
    final List<MovieModel> playingNow = await _movieRepository.getPlayingNow();
    final List<MovieModel> comingSoon = await _movieRepository.getComingSoon();

    emit(
      MoviesLoaded(
        trending: trending,
        popular: popular,
        playingNow: playingNow,
        comingSoon: comingSoon,
      ),
    );
  }
}
