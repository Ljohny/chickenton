import 'package:flutter/material.dart';

/// 앱 전체에서 사용되는 색상을 정의하는 ThemeExtension
@immutable
class AppColors extends ThemeExtension<AppColors> {
  /// 생성자
  const AppColors({
    required this.surface,
    required this.background,
    required this.cardBackground,
    required this.textPrimary,
    required this.textSecondary,
    required this.primary,
    required this.secondary,
    required this.error,
    required this.success,
    required this.warning,
    required this.borderColor,
    required this.activeTab,
    required this.tagBackground,
    required this.tagText,
    required this.divider,
  });

  /// Surface 배경색
  final Color surface;

  /// 전체 배경색
  final Color background;

  /// 카드 배경색
  final Color cardBackground;

  /// 기본 텍스트 색상
  final Color textPrimary;

  /// 보조 텍스트 색상
  final Color textSecondary;

  /// 주요 강조 색상
  final Color primary;

  /// 보조 강조 색상
  final Color secondary;

  /// 오류 상태 표시 색상
  final Color error;

  /// 성공 상태 표시 색상
  final Color success;

  /// 경고 상태 표시 색상
  final Color warning;

  /// 테두리 색상
  final Color borderColor;

  /// 활성화된 탭 색상
  final Color activeTab;

  /// 태그 배경 색상
  final Color tagBackground;

  /// 태그 텍스트 색상
  final Color tagText;

  /// 구분선 색상
  final Color divider;

  /// 밝은 테마용 기본 컬러 정의
  static const light = AppColors(
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFF8F9FA),
    cardBackground: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF212529),
    textSecondary: Color(0xFF868E96),
    primary: Color(0xFF3498DB),
    secondary: Color(0xFF03DAC6),
    error: Color(0xFFB00020),
    success: Color(0xFF4CAF50),
    warning: Color(0xFFFFC107),
    borderColor: Color(0xFFE5E7EB),
    activeTab: Color(0xFF3498DB),
    tagBackground: Color(0xFFE9ECEF),
    tagText: Color(0xFF495057),
    divider: Color(0xFFF3F4F6),
  );

  /// 다크 테마용 기본 컬러 정의
  static const dark = AppColors(
    surface: Color(0xFF1E1E1E),
    background: Color(0xFF121212),
    cardBackground: Color(0xFF1E1E1E),
    textPrimary: Color(0xFFE0E0E0),
    textSecondary: Color(0xFFB0B0B0),
    primary: Color(0xFF64B5F6),
    secondary: Color(0xFF26C6DA),
    error: Color(0xFFCF6679),
    success: Color(0xFF81C784),
    warning: Color(0xFFFFD54F),
    borderColor: Color(0xFF2C2C2C),
    activeTab: Color(0xFF64B5F6),
    tagBackground: Color(0xFF333333),
    tagText: Color(0xFFE0E0E0),
    divider: Color(0xFF2C2C2C),
  );

  @override
  AppColors copyWith({
    Color? surface,
    Color? background,
    Color? cardBackground,
    Color? textPrimary,
    Color? textSecondary,
    Color? primary,
    Color? secondary,
    Color? error,
    Color? success,
    Color? warning,
    Color? borderColor,
    Color? activeTab,
    Color? tagBackground,
    Color? tagText,
    Color? divider,
  }) => AppColors(
    surface: surface ?? this.surface,
    background: background ?? this.background,
    cardBackground: cardBackground ?? this.cardBackground,
    textPrimary: textPrimary ?? this.textPrimary,
    textSecondary: textSecondary ?? this.textSecondary,
    primary: primary ?? this.primary,
    secondary: secondary ?? this.secondary,
    error: error ?? this.error,
    success: success ?? this.success,
    warning: warning ?? this.warning,
    borderColor: borderColor ?? this.borderColor,
    activeTab: activeTab ?? this.activeTab,
    tagBackground: tagBackground ?? this.tagBackground,
    tagText: tagText ?? this.tagText,
    divider: divider ?? this.divider,
  );

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      surface: Color.lerp(surface, other.surface, t)!,
      background: Color.lerp(background, other.background, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      activeTab: Color.lerp(activeTab, other.activeTab, t)!,
      tagBackground: Color.lerp(tagBackground, other.tagBackground, t)!,
      tagText: Color.lerp(tagText, other.tagText, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
    );
  }
}

/// BuildContext 확장을 통해 AppColors에 쉽게 접근할 수 있도록 합니다.
extension AppColorsExtension on BuildContext {
  /// AppColors에 쉽게 접근하기 위한 getter
  AppColors get colors {
    return Theme.of(this).extension<AppColors>() ?? AppColors.light;
  }
}
