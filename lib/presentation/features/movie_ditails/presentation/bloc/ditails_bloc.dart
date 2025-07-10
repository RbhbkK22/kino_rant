import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kino_rant/presentation/features/movie_ditails/data/movie_ditails_service.dart';
import 'package:kino_rant/presentation/features/movie_ditails/presentation/bloc/ditails_events.dart';
import 'package:kino_rant/presentation/features/movie_ditails/presentation/bloc/ditails_state.dart';

class DitailsBloc extends Bloc<DitailsEvents, DitailsState> {
  final MovieDitailsService service;

  DitailsBloc({required this.service}) : super(DitailsInit()) {
    on<LoadDitailsEvent>(_loadDitails);
  }

  FutureOr<void> _loadDitails(
    LoadDitailsEvent event,
    Emitter<DitailsState> emit,
  ) async {
    emit(DitailsLoading());
    try {
      final ditails = await service.getMovieDitails(event.imdbId);
      emit(DitailsLoaded(ditails: ditails));
    } catch (e) {
      emit(DitailsError(message: e.toString()));
    }
  }
}
