import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kino_rant/features/main/user_comment_model.dart';

class UserCommentService {
  Future<List<UserCommentModel>> getUserComment() async {
    final userUid = FirebaseAuth.instance.currentUser!.uid;
    final List<UserCommentModel> allComments = [];

    try {
      final snapshot = await FirebaseFirestore.instance
          .collectionGroup('comments')
          .where('userId', isEqualTo: userUid)
          .get();

      for (var doc in snapshot.docs) {
        final data = doc.data();
        final comment = data['comment'] ?? '';

        // Получаем movieId из пути reviews/{movieId}/comments/{userId}
        final movieId = doc.reference.parent.parent?.id ?? 'unknown';

        allComments.add(
          UserCommentModel(
            text: comment,
            imdbId: movieId,
            // добавь другие поля, если есть в модели
          ),
        );
      }

      return allComments;
    } catch (e) {
      throw Exception('Ошибка при получении комментариев: $e');
    }
  }
}
