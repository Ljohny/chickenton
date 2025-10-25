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

  // In the future, you can add methods to add, update, or delete posts.
  // Example:
  // Future<void> addPost(Post post) async { ... }
}
