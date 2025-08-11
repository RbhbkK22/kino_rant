import 'package:flutter/material.dart';
import 'package:kino_rant/features/comments/domain/entities/review.dart';

class Comment extends StatelessWidget {
  final Review review;

  const Comment({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  "https://api.dicebear.com/9.x/glass/png?seed=${review.userName + review.userId}",
                  height: 40,
                  width: 40,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                review.userName,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          Text(
            review.comment,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
