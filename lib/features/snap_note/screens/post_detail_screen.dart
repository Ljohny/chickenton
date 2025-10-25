import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:template/features/snap_note/controllers/post_controller.dart';
import 'package:template/features/snap_note/models/post_model.dart';
import 'package:template/features/snap_note/view/create_post_screen.dart';

class PostDetailScreen extends ConsumerWidget {
  final Post post;

  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 컨트롤러의 상태를 감시(watch)하여 데이터 변경 시 화면이 다시 그려지도록 함
    final postAsyncValue = ref.watch(postControllerProvider);

    return Scaffold(
      appBar: AppBar(
        // postAsyncValue가 data 상태일 때, 최신 post 객체를 찾아 제목을 표시
        title: postAsyncValue.when(
          data: (posts) {
            final updatedPost = posts.firstWhere(
              (p) => p.id == post.id,
              orElse: () => post,
            );
            return Text(DateFormat('yyyy-MM-dd').format(updatedPost.timestamp));
          },
          loading: () => const Text(''), // 로딩 중에는 제목 없음
          error: (err, stack) => const Text(''), // 에러 시 제목 없음
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'edit') {
                // 수정 후 돌아왔을 때 화면이 갱신되도록 push 방식 사용
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreatePostScreen(post: post),
                  ),
                );
              } else if (value == 'delete') {
                await ref
                    .read(postControllerProvider.notifier)
                    .deletePost(post.id);
                if (context.mounted) Navigator.of(context).pop();
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'edit',
                child: Text('수정'),
              ),
              const PopupMenuItem<String>(
                value: 'delete',
                child: Text('삭제'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: postAsyncValue.when(
          data: (posts) {
            // 목록에서 현재 post ID와 일치하는 최신 데이터를 찾음
            final updatedPost = posts.firstWhere(
              (p) => p.id == post.id,
              orElse: () => post,
            );
            return SingleChildScrollView(
              child: Text(
                updatedPost.content,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) =>
              Center(child: Text('게시글을 불러오는 데 실패했습니다: $error')),
        ),
      ),
    );
  }
}
