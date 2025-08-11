import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kino_rant/features/comments/data/comments_repository_impl.dart';
import 'package:kino_rant/features/comments/presintation/bloc/review_events.dart';
import 'package:kino_rant/features/comments/presintation/bloc/review_state.dart';

class ReviewBloc extends Bloc<ReviewEvents, ReviewState> {
  final CommentsRepositoryImpl commentsRepositoryImpl;

  ReviewBloc({required this.commentsRepositoryImpl}) : super(ReviewInit()) {
    on<LoadReviewEvent>(_getReviewsByFilmId);
    on<AddReviewEvent>(_addReview);
  }

  FutureOr<void> _getReviewsByFilmId(
    LoadReviewEvent event,
    Emitter<ReviewState> emit,
  ) async {
    emit(ReviewLoading());
    try {
      final reviews = await commentsRepositoryImpl.getReviewByFilmId(
        event.imdbId,
      );
      debugPrint("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!$reviews");
      emit(ReviewLoaded(reviews: reviews));
    } catch (e) {
      debugPrint(e.toString());
      emit(ReviewError(message: e.toString()));
    }
  }

  FutureOr<void> _addReview(AddReviewEvent event, Emitter<ReviewState> emit) async {
    emit(ReviewLoading());
    try {
      await commentsRepositoryImpl.addReview(event.reviewText, event.imdbId);
      emit(ReviewSuccess());  
    } catch (e) {
      emit(ReviewError(message: e.toString()));
    }
  }
}
