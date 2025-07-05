import 'package:kino_rant/presentation/features/movies/data/movie_api_client.dart';
import 'package:kino_rant/presentation/features/movies/domain/entities/movie.dart';
import 'package:kino_rant/presentation/features/movies/domain/repositories/movie_repositoy.dart';

class MovieRepositoryImpl implements MovieRepositoy {
  final MovieApiClient apiClient;

  MovieRepositoryImpl({required this.apiClient});

  @override
  Future<List<Movie>> getPopularMovies() {
    return apiClient.fetchPopularMovies();
  }
}
