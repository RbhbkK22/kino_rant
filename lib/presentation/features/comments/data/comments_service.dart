import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kino_rant/presentation/features/comments/data/models/review_model.dart';
import 'package:kino_rant/presentation/features/comments/domain/entities/review.dart';

class CommentsService {
  Future<List<Review>> getReviewByFilmId(String imdbId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('reviews')
        .doc(imdbId)
        .collection('comments')
        .get();
    return snapshot.docs.map((doc) => ReviewModel.fromFirestore(doc)).toList();
  }
}
