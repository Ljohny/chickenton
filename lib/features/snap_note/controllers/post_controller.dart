import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/features/snap_note/models/post_model.dart';

// 1. Provider Definition
final postControllerProvider =
    AsyncNotifierProvider<PostController, List<Post>>(
      () => PostController(),
    );

// 2. Controller Implementation
class PostController extends AsyncNotifier<List<Post>> {
  @override
  Future<List<Post>> build() async {
    return _loadPosts();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Post>> _loadPosts() async {
    final snapshot = await _firestore
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .get();
    final posts = snapshot.docs.map((doc) => Post.fromFirestore(doc)).toList();
    return posts;
  }

  Future<void> addPost(String content) async {
    // 로딩 상태로 변경
    state = const AsyncValue.loading();

    // 상태를 직접 업데이트하여 사용자 경험 개선
    state = await AsyncValue.guard(() async {
      // Firestore에 데이터 추가
      await _firestore.collection('posts').add({
        'content': content,
        'timestamp': FieldValue.serverTimestamp(),
      });
      // 데이터 추가 후 목록 다시 로드
      return _loadPosts();
    });
  }
}
