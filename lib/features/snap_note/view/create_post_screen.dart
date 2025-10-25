import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('글쓰기'),
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
            onPressed: () {
              // TODO: 게시 기능 구현
              if (_textController.text.isNotEmpty) {
                // 기능 구현 후 Navigator.pop(context); 호출
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('게시글이 성공적으로 등록되었습니다.')),
                );
                Navigator.pop(context);
              }
            },
            child: const Text('게시'),
          ),
        ),
      ),
    );
  }
}
