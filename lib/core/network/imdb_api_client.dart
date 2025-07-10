import 'package:dio/dio.dart';

class ImdbApiClient {
  static final ImdbApiClient _instance = ImdbApiClient._internal();

  factory ImdbApiClient() => _instance;

  late final Dio dio;

  ImdbApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://www.omdbapi.com',
        headers: {"content-type": "application/json"},
      ),
    );
  }
}
