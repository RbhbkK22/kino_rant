import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kino_rant/features/comments/widgets/comment_text_field.dart';

import 'package:kino_rant/features/movie_ditails/presentation/bloc/combinated/combinatad_cubit_ditails.dart';
import 'package:kino_rant/features/comments/presintation/bloc/review_bloc.dart';
import 'package:kino_rant/features/comments/presintation/bloc/review_events.dart';
import 'package:kino_rant/features/comments/presintation/review_list_view.dart';
import 'package:kino_rant/features/movie_ditails/presentation/bloc/ditails_bloc.dart';
import 'package:kino_rant/features/movie_ditails/presentation/bloc/ditails_events.dart';
import 'package:kino_rant/features/movie_ditails/widgets/ditails.dart';
import 'package:kino_rant/features/movies/domain/entities/movie.dart';
import 'package:kino_rant/features/movies/widgets/poster_view.dart';

class MovieDitails extends StatelessWidget {
  final Movie movie;
  final TextEditingController reviewController = TextEditingController();
  MovieDitails({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    context.read<DitailsBloc>().add(LoadDitailsEvent(imdbId: movie.imdbId));
    context.read<ReviewBloc>().add(LoadReviewEvent(imdbId: movie.imdbId));
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<CombinatadCubitDitails, CombinatadDitailsState>(
        builder: (context, combinatedState) {
          if (combinatedState.allLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Stack(
            children: [
              PosterView(
                movie: movie,
                width: double.infinity,
                height: 420,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(26),
                  bottomRight: Radius.circular(26),
                ),
              ),
              Positioned(
                top: 50,
                left: 17,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(
                      Color(0xff1E1E1E),
                    ),
                    minimumSize: const WidgetStatePropertyAll(Size(50, 50)),
                  ),
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.55,
                maxChildSize: 1,
                builder: (context, scrollController) {
                  return Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 26,
                      right: 20,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xff1E1E1E),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText(
                            '${movie.title} (${movie.year})',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Ditails(imdbId: movie.imdbId),
                          Text(
                            'Напишите свое мнение',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CommentTextField(
                                  controller: reviewController,
                                ),
                              ),
                              SizedBox(width: 15),
                              IconButton(
                                onPressed: () async {
                                  final reviewBloc = context.read<ReviewBloc>();

                                  reviewBloc.add(
                                    AddReviewEvent(
                                      imdbId: movie.imdbId,
                                      reviewText: reviewController.text,
                                    ),
                                  );

                                  await Future.delayed(
                                    Duration(milliseconds: 300),
                                  );
                                  reviewController.clear();
                                  reviewBloc.add(
                                    LoadReviewEvent(imdbId: movie.imdbId),
                                  );
                                },
                                icon: Icon(Icons.send, color: Colors.white),
                                style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      side: BorderSide.none,
                                      borderRadius:
                                          BorderRadiusGeometry.circular(16),
                                    ),
                                  ),
                                  minimumSize: WidgetStatePropertyAll(
                                    Size(49, 49),
                                  ),
                                  backgroundColor: WidgetStatePropertyAll(
                                    Color(0xFFEB2F3D),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(),
                          Text(
                            'Отзывы',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          const Divider(),
                          ReviewListView(imdbId: movie.imdbId),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
