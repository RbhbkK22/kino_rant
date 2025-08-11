import 'package:kino_rant/features/movie_ditails/data/models/movie_ditails_model.dart';

abstract class DitailsState {}

class DitailsInit extends DitailsState {}

class DitailsLoading extends DitailsState {}

class DitailsLoaded extends DitailsState {
  final MovieDitailsModel ditails;

  DitailsLoaded({required this.ditails});
}

class DitailsError extends DitailsState {
 final String message;

  DitailsError({required this.message});
}
