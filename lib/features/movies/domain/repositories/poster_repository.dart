import 'package:kino_rant/features/movies/domain/entities/poster.dart';

abstract class PosterRepository {
  Future<Poster> getPosterUrl();
}