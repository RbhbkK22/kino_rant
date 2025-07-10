import 'package:kino_rant/presentation/features/comments/domain/entities/review.dart';

abstract class CommentsRepository {
  Future<List<Review>> getReviewByFilmId(String imdbId);
}