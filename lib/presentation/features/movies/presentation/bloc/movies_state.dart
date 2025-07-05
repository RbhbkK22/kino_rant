import 'package:kino_rant/presentation/features/movies/domain/entities/movie.dart';

abstract class MoviesState {}

class MovieInitial extends MoviesState {}

class MovieLoading extends MoviesState {}

class MovieLoaded extends MoviesState {
  final List<Movie> movies;

  MovieLoaded({required this.movies});
}

class MovieError extends MoviesState {
  final String message;

  MovieError({required this.message});
}
