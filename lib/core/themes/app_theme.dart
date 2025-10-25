import 'package:flutter/material.dart';
import 'package:template/core/themes/app_colors.dart';

/// 앱 전체에서 사용되는 테마 설정을 정의하는 클래스
class AppTheme {
  /// 라이트 모드 테마 설정을 반환합니다.
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.light.primary,
        secondary: AppColors.light.secondary,
        surface: AppColors.light.surface,
        background: AppColors.light.background,
        error: AppColors.light.error,
      ),
      extensions: const <ThemeExtension<dynamic>>[
        AppColors.light,
      ],
      scaffoldBackgroundColor: AppColors.light.background,
    );
  }

  /// 다크 모드 테마 설정을 반환합니다.
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.dark.primary,
        secondary: AppColors.dark.secondary,
        surface: AppColors.dark.surface,
        background: AppColors.dark.background,
        error: AppColors.dark.error,
      ),
      extensions: const <ThemeExtension<dynamic>>[
        AppColors.dark,
      ],
      scaffoldBackgroundColor: AppColors.dark.background,
    );
  }
}
