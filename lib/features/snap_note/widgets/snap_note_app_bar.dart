import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/core/themes/app_colors.dart';
import 'package:template/core/themes/app_typography.dart';

class SnapNoteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SnapNoteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.cardBackground,
      elevation: 0,
      title: Row(
        children: [
          SvgPicture.asset(
            'assets/logo.svg',
            height: 28,
          ),
          const SizedBox(width: 8),
          const Text(
            'SnapNote',
            style: AppTypography.headerTitle,
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/search.svg',
            height: 24,
          ),
          onPressed: () {
            // TODO: Implement search functionality
          },
        ),
      ],
      shape: Border(
        bottom: BorderSide(
          color: context.colors.borderColor,
          width: 1,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
