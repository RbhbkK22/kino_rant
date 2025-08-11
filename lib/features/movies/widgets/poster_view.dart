import 'package:flutter/material.dart';
import 'package:kino_rant/features/movies/data/poster_api_service.dart';
import 'package:kino_rant/features/movies/data/poster_repository_impl.dart';
import 'package:kino_rant/features/movies/domain/entities/movie.dart';
import 'package:kino_rant/features/movies/domain/entities/poster.dart';

class PosterView extends StatefulWidget {
  final Movie movie;
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const PosterView({
    super.key,
    required this.movie,
    this.width = 110,
    this.height = 160,
    this.borderRadius,
  });

  @override
  State<PosterView> createState() => _PosterViewState();
}

class _PosterViewState extends State<PosterView> {
  final posterApi = PosterApiService();
  late final PosterRepositoryImpl posterRepo;
  Poster? poster; // nullable

  @override
  void initState() {
    super.initState();
    posterRepo = PosterRepositoryImpl(
      posterApiService: posterApi,
      imdbId: widget.movie.imdbId,
    );
    _loadPoster(); // запускаем асинхронную загрузку
  }

  Future<void> _loadPoster() async {
    final result = await posterRepo.getPosterUrl();

    if (!mounted) return; // ← защита от setState после dispose

    setState(() {
      poster = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (poster == null) {
      return const SizedBox(
        width: 110,
        height: 160,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(26),
      child: ColorFiltered(
        colorFilter: const ColorFilter.matrix(<double>[
          1,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
        ]),
        child: Image.network(
          poster!.posterUrl,
          width: widget.width,
          height: widget.height,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error, color: Colors.white);
          },
        ),
      ),
    );
  }
}
