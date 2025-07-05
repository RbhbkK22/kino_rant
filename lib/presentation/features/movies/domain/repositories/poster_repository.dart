import 'package:kino_rant/presentation/features/movies/domain/entities/poster.dart';

abstract class PosterRepository {
  Future<Poster> getPosterUrl();
}