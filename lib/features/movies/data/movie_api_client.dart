import 'package:dio/dio.dart';
import 'package:kino_rant/core/network/movies_api_client.dart';
import 'package:kino_rant/features/movies/data/models/movie_model.dart';

class MovieApiClient {
  final Dio _dio = MoviesApiClient().dio;

  Future<List<MovieModel>> fetchPopularMovies() async {
    final response = await _dio.get('/movies/trending');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
// '/movies/trending'