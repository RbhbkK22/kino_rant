abstract class ReviewEvents {}

class LoadReviewEvent extends ReviewEvents {
  final String imdbId;

  LoadReviewEvent({required this.imdbId});

}

class AddReviewEvent extends ReviewEvents {
  final String imdbId;
  final String reviewText;

  AddReviewEvent({required this.imdbId, required this.reviewText});
}
