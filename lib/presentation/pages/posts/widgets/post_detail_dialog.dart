import 'package:flutter/material.dart';

import '../../../../domain/models/post_model.dart';

class PostDetailDialog extends StatelessWidget {
  final PostModel post;

  const PostDetailDialog({super.key, required this.post});

  static Future<void> show(BuildContext context, PostModel post) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return PostDetailDialog(post: post);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Post #${post.id}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Title:',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(post.title, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 16),
            const Text(
              'Content:',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(post.body, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  'User ID: ',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                Text(
                  post.userId.toString(),
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
