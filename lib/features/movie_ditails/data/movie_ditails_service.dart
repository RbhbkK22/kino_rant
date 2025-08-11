import 'package:dio/dio.dart';
import 'package:kino_rant/core/network/imdb_api_client.dart';
import 'package:kino_rant/features/movie_ditails/data/models/movie_ditails_model.dart';

class MovieDitailsService {
  final Dio _dio = ImdbApiClient().dio;

  Future<MovieDitailsModel> getMovieDitails(String imdbId) async {

    final response = await _dio.get("/?apikey=9670f9b8&i=$imdbId");
    if (response.statusCode == 200) {
      final MovieDitailsModel ditals = MovieDitailsModel.fromJson(
        response.data,
      );
      return ditals;
    } else {
      throw Exception('Постера нет');
    }
  }
}
