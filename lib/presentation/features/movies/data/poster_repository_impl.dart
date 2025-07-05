import 'package:kino_rant/presentation/features/movies/data/poster_api_service.dart';
import 'package:kino_rant/presentation/features/movies/domain/entities/poster.dart';
import 'package:kino_rant/presentation/features/movies/domain/repositories/poster_repository.dart';

class PosterRepositoryImpl extends PosterRepository {
  final PosterApiService posterApiService;

  final String imdbId;

  PosterRepositoryImpl({required this.posterApiService, required this.imdbId});

  @override
  Future<Poster> getPosterUrl() {
    return posterApiService.getPosterUrl(imdbId);
  }
}
