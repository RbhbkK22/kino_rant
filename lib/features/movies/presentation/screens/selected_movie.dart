import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kino_rant/features/comments/presintation/review_list_view.dart';
import 'package:kino_rant/features/movies/domain/entities/movie.dart';
import 'package:kino_rant/features/movies/widgets/poster_view.dart';

class SelectedMovie extends StatefulWidget {
  final Movie movie;

  const SelectedMovie({super.key, required this.movie});

  @override
  State<SelectedMovie> createState() => _SelectedMovieState();
}

class _SelectedMovieState extends State<SelectedMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // АНИМАЦИЯ ПОСТЕРА
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: 1,
            child: PosterView(
              movie: widget.movie,
              width: double.infinity,
              height: 420,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(26),
                bottomRight: Radius.circular(26),
              ),
            ),
          ),

          // КНОПКА НАЗАД
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

          // БЛОК С КОНТЕНТОМ
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification) {
                setState(() {});
              }
              return false;
            },
            child: DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.55,
              maxChildSize: 1,
              builder: (context, scrollController) {
                return Container(
                  padding: const EdgeInsets.only(left: 16, top: 26, right: 20),
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
                        Text(
                          '${widget.movie.title} (${widget.movie.year})',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Страна: Странная',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Длительность:\n116 min.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Дата выхода:\n02 Jul 2025.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 8),
                        const Text(
                          'Описание:\nФильм "Иди и смотри", снятый Элемом Климовым в 1985 году, рассказывает о зверствах нацистов во время Великой Отечественной войны на территории Белоруссии. В центре сюжета — белорусский подросток Флёра, который, присоединившись к партизанам, становится свидетелем карательной операции и переживает ужасы, превращающие его из жизнерадостного юноши в седого старика. ',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const Divider(),
                        Text(
                          'Напишите свое мнение',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        SizedBox(
                          child: TextField(
                            cursorColor: Color(0xFF575757),
                            style: TextStyle(
                              color: Color.fromARGB(255, 150, 150, 150),
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              filled: true,
                              hintText: "Расскажите как вам фильм",
                              hintStyle: TextStyle(
                                color: Color(0xFF575757),
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF2A2A2A),
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF2A2A2A),
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF2A2A2A),
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(),
                        Text(
                          'Отзывы',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        const Divider(),
                        ReviewListView(imdbId: widget.movie.imdbId),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
