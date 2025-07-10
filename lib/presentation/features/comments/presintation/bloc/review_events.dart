abstract class ReviewEvents {}

class LoadReviewEvent extends ReviewEvents {
  final String imdbId;

  LoadReviewEvent({required this.imdbId});

}
