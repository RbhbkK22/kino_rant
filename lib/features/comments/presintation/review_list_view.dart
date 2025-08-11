import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kino_rant/features/comments/presintation/bloc/review_bloc.dart';
import 'package:kino_rant/features/comments/presintation/bloc/review_state.dart';
import 'package:kino_rant/features/comments/widgets/comment.dart';


class ReviewListView extends StatelessWidget {
  final String imdbId;


  const ReviewListView({super.key, required this.imdbId});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewBloc, ReviewState>(
      builder: (context, state) {
        if (state is ReviewLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ReviewLoaded) {
          final reviews = state.reviews;
          if (reviews.isEmpty) {
            return Center(
              child: Text(
                'Нет коментариев',
                style: TextStyle(color: Colors.white),
              ),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.separated(
                  padding: EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    final review = reviews[index];
                    return Comment(review: review);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                ),
              ],
            );
          }
        } else if (state is ReviewError) {
          return Center(
            child: SelectableText(
              state.message,
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
