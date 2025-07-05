import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kino_rant/presentation/features/movies/domain/repositories/movie_repositoy.dart';
import 'package:kino_rant/presentation/features/movies/presentation/bloc/movies_event.dart';
import 'package:kino_rant/presentation/features/movies/presentation/bloc/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MovieRepositoy repository;

  MoviesBloc({required this.repository}) : super(MovieInitial()) {
    on<FetchPopularMovies>(_fetchPopularMovies);
  }

  FutureOr<void> _fetchPopularMovies(
    FetchPopularMovies event,
    Emitter<MoviesState> emit,
  ) async {
    emit(MovieLoading());
    try {
      final movies = await repository.getPopularMovies();
      emit(MovieLoaded(movies: movies));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }
}
