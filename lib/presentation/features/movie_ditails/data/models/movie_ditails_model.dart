class MovieDitailsModel {
  final String released;
  final String runtime;
  final String country;
  final String plot;
  final String poster;

  MovieDitailsModel({
    required this.released,
    required this.runtime,
    required this.country,
    required this.plot,
    required this.poster,
  });

  factory MovieDitailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDitailsModel(
      released: json['Released'],
      runtime: json["Runtime"],
      country: json["Country"],
      plot: json["Plot"],
      poster: json["Poster"],
    );
  }
}
