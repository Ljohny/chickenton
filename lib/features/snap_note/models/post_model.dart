import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String content;
  final DateTime timestamp;

  Post({
    required this.id,
    required this.content,
    required this.timestamp,
  });

  factory Post.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Post(
      id: doc.id,
      content: data['content'] ?? '',
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }
}
