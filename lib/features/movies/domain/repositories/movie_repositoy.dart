import 'package:kino_rant/features/movies/domain/entities/movie.dart';

abstract class MovieRepositoy {
  Future<List<Movie>> getPopularMovies();
}
