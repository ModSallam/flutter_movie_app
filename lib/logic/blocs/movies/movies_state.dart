part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<MovieModel>? trending;
  final List<MovieModel>? popular;
  final List<MovieModel>? playingNow;
  final List<MovieModel>? comingSoon;

  const MoviesState({
    required this.trending,
    required this.popular,
    required this.playingNow,
    required this.comingSoon,
  });

  @override
  List<Object?> get props => [trending, popular, playingNow, comingSoon];
}

class MoviesInitial extends MoviesState {
  const MoviesInitial({
    super.trending = const [],
    super.popular = const [],
    super.playingNow = const [],
    super.comingSoon = const [],
  });

  @override
  List<Object?> get props => [trending, popular, playingNow, comingSoon];
}

class MoviesLoading extends MoviesState {
  const MoviesLoading({
    required super.trending,
    required super.popular,
    required super.playingNow,
    required super.comingSoon,
  });

  @override
  List<Object?> get props => [trending, popular, playingNow, comingSoon];
}

class MoviesLoaded extends MoviesState {
  const MoviesLoaded({
    required super.trending,
    required super.popular,
    required super.playingNow,
    required super.comingSoon,
  });

  @override
  List<Object?> get props => [trending, popular, playingNow, comingSoon];
}
