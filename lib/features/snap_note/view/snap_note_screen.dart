import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/core/themes/app_colors.dart';
import 'package:template/features/snap_note/controllers/post_controller.dart';
import 'package:template/features/snap_note/models/post_model.dart';
import 'package:template/features/snap_note/view/create_post_screen.dart';
import 'package:template/features/snap_note/widgets/post_card.dart';
import 'package:template/features/snap_note/widgets/snap_note_app_bar.dart';
import 'package:template/features/snap_note/widgets/sort_tabs.dart';

class SnapNoteScreen extends ConsumerWidget {
  const SnapNoteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(postControllerProvider);

    return Scaffold(
      appBar: const SnapNoteAppBar(),
      body: postsAsyncValue.when(
        data: (List<Post> posts) {
          return ListView.builder(
            itemCount: posts.length + 1, // +1 for the SortTabs
            itemBuilder: (context, index) {
              if (index == 0) {
                return const SortTabs();
              }
              final post = posts[index - 1];
              return PostCard(post: post);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object error, StackTrace stack) => Center(
          child: Text('An error occurred: $error'), // Proper error display
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatePostScreen()),
          );
        },
        backgroundColor: context.colors.primary,
        child: SvgPicture.asset(
          'assets/edit.svg',
          height: 24,
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
