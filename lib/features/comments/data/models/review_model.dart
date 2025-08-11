import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kino_rant/features/comments/domain/entities/review.dart';

class ReviewModel extends Review {
  ReviewModel({
    required super.userId,
    required super.userName,
    required super.comment,
  });

  factory ReviewModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ReviewModel(
      userId: data['userId'],
      userName: data['userName'],
      comment: data['comment'],
    );
  }
}
