import 'package:flutter/material.dart';

/// 앱 전체에서 사용되는 텍스트 스타일을 정의하는 클래스
/// TODO: 'Inter' 폰트 asset 추가 필요
class AppTypography {
  /// 헤더 타이틀 (20pt, 볼드)
  static const headerTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  /// 포스트 타이틀 (16pt, 볼드)
  static const postTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  /// 포스트 본문 (14pt, 일반)
  static const postBody = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );

  /// 탭 라벨 (14pt, 중간)
  static const tabLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );

  /// 포스트 메타데이터 (12pt, 일반)
  static const postMetadata = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );

  /// 태그 (12pt, 중간)
  static const tag = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );

  /// 큰 제목 스타일 (32px, 일반)
  static const heading = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );

  /// 중간 제목 스타일 (20px, 볼드)
  static const title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );

  /// 일반 본문 스타일 (16px, 일반)
  static const body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );

  /// 작은 텍스트 스타일 (14px, 일반)
  static const caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );
}
