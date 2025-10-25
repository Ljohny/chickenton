import 'package:flutter/material.dart';
import 'package:template/core/themes/app_colors.dart';
import 'package:template/core/themes/app_typography.dart';

class SortTabs extends StatefulWidget {
  const SortTabs({super.key});

  @override
  State<SortTabs> createState() => _SortTabsState();
}

class _SortTabsState extends State<SortTabs> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.cardBackground,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: context.colors.background,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            _buildTab(context, '최신순', 0),
            _buildTab(context, '인기순', 1),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(BuildContext context, String text, int index) {
    final bool isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? context.colors.activeTab : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              text,
              style: AppTypography.tabLabel.copyWith(
                color: isSelected ? Colors.white : context.colors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
