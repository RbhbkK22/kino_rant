import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kino_rant/presentation/features/movies/domain/entities/movie.dart';
import 'package:kino_rant/presentation/features/movies/widgets/poster_view.dart';

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
                          "Описание:\nWhen the UK Prime Minister and US President become the targets of a foreign adversary...",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const Divider(),
                        Text(
                          'Отзывы',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        const Divider(),
                        ListView.builder(
                          padding: EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        "https://api.dicebear.com/9.x/glass/png?seed=Felex",
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Item $index",
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Фильм просто говнище',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Divider(),
                                ],
                              ),
                            );
                          },
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
    );
  }
}
