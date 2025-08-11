import 'package:kino_rant/features/comments/domain/entities/review.dart';

abstract class ReviewState {}

class ReviewInit extends ReviewState {}

class ReviewLoading extends ReviewState {}

class ReviewLoaded extends ReviewState {
  final List<Review> reviews;

  ReviewLoaded({required this.reviews});
}

class ReviewError extends ReviewState {
  final String message;

  ReviewError({required this.message});
}

class ReviewSuccess extends ReviewState {}
