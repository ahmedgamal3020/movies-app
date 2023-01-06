import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backDropPath;
  final List<int> genreIds;
  final String overView;
  final double voteAverage;
  final String releaseDate;

 const  Movie({
    required this.id,
    required this.title,
    required this.backDropPath,
    required this.genreIds,
    required this.overView,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object> get props =>
      [
        id,
        title,
        backDropPath,
        genreIds,
        overView,
        voteAverage,
        releaseDate,

      ];
}