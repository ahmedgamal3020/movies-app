import 'package:equatable/equatable.dart';

class MovieRecommendations extends Equatable {
  final String ? backdropPath;
  final int id;

  const MovieRecommendations({ this.backdropPath,required this.id});




  @override
  List<Object?> get props => [backdropPath];
}