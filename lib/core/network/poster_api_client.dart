import 'package:dio/dio.dart';

class PosterApiClient {
  static final PosterApiClient _instance = PosterApiClient._internal();

  factory PosterApiClient() => _instance;

  late final Dio dio;

  PosterApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://www.omdbapi.com',
        headers: {
          "content-type": "application/json",
        },
      ),
    );
  }
}