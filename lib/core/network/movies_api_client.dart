import 'package:dio/dio.dart';

class MoviesApiClient {
  static final MoviesApiClient _instance = MoviesApiClient._internal();

  factory MoviesApiClient() => _instance;

  late final Dio dio;

  MoviesApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:3000',
        headers: {
          "content-type": "application/json",
          "trakt-api-version": '2',
          "trakt-api-key":
              "",
        },
      ),
    );
  }
}