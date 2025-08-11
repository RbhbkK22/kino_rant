import 'package:kino_rant/features/movies/domain/entities/poster.dart';

class PosterModel extends Poster {
  PosterModel({required super.posterUrl});

  factory PosterModel.fromJson(Map<String, dynamic> json) {
    return PosterModel(posterUrl: json["Poster"] ?? "");
  }
}
