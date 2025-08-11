import 'package:kino_rant/features/comments/data/comments_service.dart';
import 'package:kino_rant/features/comments/domain/entities/review.dart';
import 'package:kino_rant/features/comments/domain/repositories/comments_repository.dart';

class CommentsRepositoryImpl implements CommentsRepository {
  final CommentsService commentsService;

  CommentsRepositoryImpl({required this.commentsService});

  @override
  Future<List<Review>> getReviewByFilmId(String imdbId) =>
      commentsService.getReviewByFilmId(imdbId);

  @override
  Future<String> addReview(String reviewText, String imdbId) =>
      commentsService.addReview(reviewText, imdbId);
}
