import 'package:dio/dio.dart';
import 'package:kino_rant/core/network/poster_api_client.dart';
import 'package:kino_rant/presentation/features/movies/data/models/poster_model.dart';
import 'package:kino_rant/presentation/features/movies/domain/entities/poster.dart';

class PosterApiService {
  final Dio _dio = PosterApiClient().dio;

  Future<Poster> getPosterUrl(String imdbId) async {
    final response = await _dio.get('/?apikey=9670f9b8&i=$imdbId');
    if (response.statusCode == 200) {
      final Poster poster = PosterModel.fromJson(response.data);
      return poster;
    } else {
      throw Exception('Постера нет');
    }
  }
}
