import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/features/snap_note/controllers/post_controller.dart';
import 'package:template/features/snap_note/models/post_model.dart';

class CreatePostScreen extends ConsumerStatefulWidget {
  final Post? post; // 수정할 Post 객체 (새 글 작성 시에는 null)

  const CreatePostScreen({super.key, this.post});

  @override
  ConsumerState<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<CreatePostScreen> {
  final TextEditingController _textController = TextEditingController();

  bool get _isEditing => widget.post != null;

  @override
  void initState() {
    super.initState();
    if (_isEditing) {
      _textController.text = widget.post!.content;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _submitPost() async {
    if (_textController.text.isNotEmpty) {
      final notifier = ref.read(postControllerProvider.notifier);
      if (_isEditing) {
        // 글 수정
        await notifier.updatePost(widget.post!.id, _textController.text);
      } else {
        // 새 글 작성
        await notifier.addPost(_textController.text);
      }

      // 성공 메시지 표시 및 화면 닫기
      if (mounted) {
        final message = _isEditing
            ? '게시글이 성공적으로 수정되었습니다.'
            : '게시글이 성공적으로 등록되었습니다.';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? '글 수정' : '글쓰기'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  hintText: '사진 1장과 글을 가볍게 올려보세요.',
                  border: InputBorder.none,
                ),
                maxLines: null,
                expands: true,
                maxLength: 1000,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ElevatedButton(
            onPressed: _submitPost,
            child: Text(_isEditing ? '수정' : '게시'),
          ),
        ),
      ),
    );
  }
}
