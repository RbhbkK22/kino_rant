import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kino_rant/presentation/features/comments/data/comments_repository_impl.dart';
import 'package:kino_rant/presentation/features/comments/presintation/bloc/review_events.dart';
import 'package:kino_rant/presentation/features/comments/presintation/bloc/review_state.dart';

class ReviewBloc extends Bloc<ReviewEvents, ReviewState> {
  final CommentsRepositoryImpl commentsRepositoryImpl;

  ReviewBloc({required this.commentsRepositoryImpl}) : super(ReviewInit()) {
    on<LoadReviewEvent>(_getReviewsByFilmId);
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
}
