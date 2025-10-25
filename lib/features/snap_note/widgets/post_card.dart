import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:template/core/themes/app_colors.dart';
import 'package:template/core/themes/app_typography.dart';
import 'package:template/features/snap_note/models/post_model.dart';
import 'package:template/features/snap_note/screens/post_detail_screen.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PostDetailScreen(post: post),
          ),
        );
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: context.colors.cardBackground,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.content,
                style: AppTypography.postBody,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Text(
                DateFormat('yyyy-MM-dd HH:mm').format(post.timestamp),
                style: AppTypography.postMetadata,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
