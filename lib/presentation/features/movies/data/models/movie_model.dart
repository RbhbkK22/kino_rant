import 'package:kino_rant/presentation/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.title,
    required super.year,
    required super.imdbId,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['movie']['title'] ?? '',
      year: json['movie']['year'] ?? '',
      imdbId: json['movie']['ids']['imdb'] ?? '',
    );
  }
}


  // {
  //   "watchers": 3001,
  //   "movie": {
  //     "title": "Thunderbolts*",
  //     "year": 2025,
  //     "ids": {
  //       "trakt": 792299,
  //       "slug": "thunderbolts-2025",
  //       "imdb": "tt20969586",
  //       "tmdb": 986056
  //     }
  //   }
  // },
