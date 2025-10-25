# 디자인 시스템 가이드

이 문서는 프로젝트의 일관된 UI/UX를 유지하기 위한 디자인 시스템의 구조와 사용법을 설명합니다. 모든 UI 개발은 이 가이드를 따라야 합니다.

## 1. 핵심 원칙

- **중앙화**: 모든 디자인 요소(색상, 폰트, 테마)는 `lib/core/themes` 디렉토리에서 관리합니다.
- **테마 기반**: 앱의 모든 UI는 `ThemeData`를 통해 스타일이 적용되어야 합니다. 이를 통해 다크 모드 지원과 전체적인 스타일 변경이 용이해집니다.
- **확장성**: 새로운 색상이나 폰트 스타일이 필요할 경우, 정해진 파일을 수정하여 시스템 전체에 일관되게 적용할 수 있습니다.

## 2. 색상 (Colors)

색상은 `ThemeExtension`을 사용하여 관리되며, 라이트/다크 모드에 따라 다른 값을 가집니다.

- **정의 파일**: `lib/core/themes/app_colors.dart`
- **사용법**: `BuildContext`의 extension을 통해 현재 테마에 맞는 색상을 안전하게 가져올 수 있습니다.

```dart
// ✅ 올바른 사용법
Container(
  color: context.colors.primary,
  child: Text(
    'Hello',
    style: TextStyle(color: context.colors.textPrimary),
  ),
)

// ❌ 잘못된 사용법
Container(
  color: Colors.blue,
)
```

## 3. 타이포그래피 (Typography)

폰트 스타일(크기, 굵기 등)은 `AppTypography` 클래스에서 static 상수로 정의하여 관리합니다.

- **정의 파일**: `lib/core/themes/app_typography.dart`
- **사용법**: `AppTypography`의 static 프로퍼티를 직접 사용합니다.

```dart
// ✅ 올바른 사용법
Text(
  'Title',
  style: AppTypography.title,
)

// ❌ 잘못된 사용법
Text(
  'Title',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

## 4. 테마 (Theme)

라이트 모드와 다크 모드에 대한 `ThemeData`는 `AppTheme` 클래스에서 정의합니다. 이 곳에서 `AppColors`와 `AppTypography`를 조합하여 최종 테마를 생성합니다.

- **정의 파일**: `lib/core/themes/app_theme.dart`
- **적용**: `main.dart`에서 `MaterialApp`의 `theme`과 `darkTheme` 프로퍼티에 `AppTheme.lightTheme`과 `AppTheme.darkTheme`을 각각 설정합니다.

## 5. 규칙 요약

1.  색상은 `context.colors`를 통해서만 사용합니다.
2.  폰트 스타일은 `AppTypography`에 정의된 값을 사용합니다.
3.  커스텀 위젯을 만들 때는 하드코딩된 색상이나 폰트 스타일 대신 디자인 시스템의 값을 사용해야 합니다.
4.  새로운 색상이나 스타일이 필요한 경우, `lib/core/themes` 안의 관련 파일을 수정하여 추가하는 것을 원칙으로 합니다.
