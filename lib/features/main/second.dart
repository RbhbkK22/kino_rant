import 'package:flutter/material.dart';
import 'package:kino_rant/features/main/user_comment_model.dart';
import 'package:kino_rant/features/main/user_comment_service.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final UserCommentService userCommentService = UserCommentService();
  List<UserCommentModel> comments = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    getUserComment();
  }

  Future<void> getUserComment() async {
    try {
      final result = await userCommentService.getUserComment();
      setState(() {
        comments = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(child: Text('Ошибка: $errorMessage'));
    }

    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return ListTile(
          subtitle: Text(comment.text),
          title: Text(comment.imdbId),
        );
      },
    );
  }
}
