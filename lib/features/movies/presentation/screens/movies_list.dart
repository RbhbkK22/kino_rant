import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kino_rant/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:kino_rant/features/movies/presentation/bloc/movies_event.dart';
import 'package:kino_rant/features/movies/presentation/bloc/movies_state.dart';
import 'package:kino_rant/features/movies/widgets/poster_view.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MoviesBloc>().add(FetchPopularMovies());
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MovieLoaded) {
          final movies = state.movies;
          return Center(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(),
              child: Column(
                children: [
                  TextField(),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: movies.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return GestureDetector(
                          onTap: () {
                            context.push("/movie", extra: movie);
                          },
                          child: Card(
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                PosterView(movie: movie),
                                Text(
                                  '${movie.title.toUpperCase()} (${movie.year})',
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is MovieError) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
