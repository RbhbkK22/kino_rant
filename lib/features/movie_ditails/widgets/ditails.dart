import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kino_rant/features/movie_ditails/presentation/bloc/ditails_bloc.dart';
import 'package:kino_rant/features/movie_ditails/presentation/bloc/ditails_state.dart';

class Ditails extends StatelessWidget {
  final String imdbId;

  const Ditails({super.key, required this.imdbId});

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<DitailsBloc, DitailsState>(
      builder: (context, state) {
        if (state is DitailsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is DitailsLoaded) {
          final ditails = state.ditails;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Страна: ${ditails.country}',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Длительность:\n${ditails.runtime}.',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    'Дата выхода:\n${ditails.released}.',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 8),
              Text(
                'Описание:\n${ditails.plot}',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const Divider(),
            ],
          );
        } else if (state is DitailsError) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          );
        } else {
          return Center(
            child: Text(
              'что то не так',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          );
        }
      },
    );
  }
}
