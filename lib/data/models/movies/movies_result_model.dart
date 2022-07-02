import 'package:equatable/equatable.dart';
import 'package:movie_app/data/data.dart';

class MoviesResultModel extends Equatable {
  final int? page;
  final List<MovieModel>? results;
  final int? totalPages;
  final int? totalResults;

  const MoviesResultModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (page != null) {
      result.addAll({'page': page});
    }
    if (results != null) {
      result.addAll({'results': results!.map((x) => x.toMap()).toList()});
    }
    if (totalPages != null) {
      result.addAll({'totalPages': totalPages});
    }
    if (totalResults != null) {
      result.addAll({'totalResults': totalResults});
    }

    return result;
  }

  factory MoviesResultModel.fromMap(Map<String, dynamic> map) {
    return MoviesResultModel(
      page: map['page']?.toInt(),
      results: map['results'] != null
          ? List<MovieModel>.from(
              map['results']?.map((x) => MovieModel.fromMap(x)))
          : null,
      totalPages: map['totalPages']?.toInt(),
      totalResults: map['totalResults']?.toInt(),
    );
  }
}
