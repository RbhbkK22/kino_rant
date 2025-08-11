import 'package:kino_rant/features/comments/domain/entities/review.dart';

abstract class CommentsRepository {
  Future<List<Review>> getReviewByFilmId(String imdbId);
  Future<String> addReview(String reviewText, String imdbId);
}