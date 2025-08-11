abstract class DitailsEvents {}

class LoadDitailsEvent extends DitailsEvents {
  final String imdbId;

  LoadDitailsEvent({required this.imdbId});
}
