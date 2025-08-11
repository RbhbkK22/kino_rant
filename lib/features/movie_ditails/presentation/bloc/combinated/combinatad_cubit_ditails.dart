import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kino_rant/features/comments/presintation/bloc/review_bloc.dart';
import 'package:kino_rant/features/comments/presintation/bloc/review_state.dart';
import 'package:kino_rant/features/movie_ditails/presentation/bloc/ditails_bloc.dart';
import 'package:kino_rant/features/movie_ditails/presentation/bloc/ditails_state.dart';

class CombinatadDitailsState {
  final bool isDiteilLoading;
  final bool isReviewLoading;

  CombinatadDitailsState({
    required this.isDiteilLoading,
    required this.isReviewLoading,
  });

  bool get allLoading => isDiteilLoading && isReviewLoading;
  bool get anyLoading => isDiteilLoading || isReviewLoading;
}

class CombinatadCubitDitails extends Cubit<CombinatadDitailsState> {
  final DitailsBloc ditailsBloc;
  final ReviewBloc reviewBloc;

  late final StreamSubscription ditailsSub;
  late final StreamSubscription reviewSub;

  CombinatadCubitDitails({required this.ditailsBloc, required this.reviewBloc})
    : super(
        CombinatadDitailsState(isDiteilLoading: true, isReviewLoading: true),
      ) {
    ditailsSub = ditailsBloc.stream.listen(_onDitailsChanged);
    reviewSub = reviewBloc.stream.listen(_onReviewChanged);
  }

  void _onDitailsChanged(DitailsState event) {
    emit(
      CombinatadDitailsState(
        isDiteilLoading: state is DitailsLoading,
        isReviewLoading: state.isReviewLoading,
      ),
    );
  }

  void _onReviewChanged(ReviewState event) {
    emit(
      CombinatadDitailsState(
        isDiteilLoading: state.isDiteilLoading,
        isReviewLoading: state is ReviewLoading,
      ),
    );
  }

  @override
  Future<void> close() {
    ditailsSub.cancel();
    reviewSub.cancel();
    return super.close();
  }
}
