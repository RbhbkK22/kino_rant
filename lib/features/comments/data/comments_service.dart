import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kino_rant/features/comments/data/models/review_model.dart';
import 'package:kino_rant/features/comments/domain/entities/review.dart';

class CommentsService {
  Future<List<Review>> getReviewByFilmId(String imdbId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('reviews')
        .doc(imdbId)
        .collection('comments')
        .get();
    return snapshot.docs.map((doc) => ReviewModel.fromFirestore(doc)).toList();
  }

  Future<String> addReview(String reviewText, String imdbId) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      final user = FirebaseAuth.instance.currentUser;
      final reviewRef = firestore
          .collection('reviews')
          .doc(imdbId)
          .collection('comments')
          .doc(user!.uid.toString());
      await reviewRef.set({
        'comment': reviewText,
        'userId': user.uid,
        'userName': user.displayName,
      });
      return 'Коментарий добавлен';
    } catch (e) {
      return e.toString();
    }
  }
}


///reviews/tt20969586/comments/RMGacDMA9ahjFEZEGml3X9f5aLx2
///comment
// "film is sheet"
// userId
// "RMGacDMA9ahjFEZEGml3X9f5aLx2"
// userName
// "Felex"