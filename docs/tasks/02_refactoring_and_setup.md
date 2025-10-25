# Step 2: 핵심 기능 리팩토링 및 설계

이 문서는 SnapNote 기능의 핵심 구조를 재설계하고 간소화하는 작업을 정의합니다. 장기적인 기능 확장을 위한 안정적인 기반을 마련하는 데 집중합니다.

## 작업 목표

### 1. `Post` 모델 간소화

- **목표**: 게시글 모델을 핵심 필드만 포함하도록 수정하여 초기 개발 단계를 단순화합니다.
- **변경 사항**:
  - **유지**: `id`, `content`, `timestamp`
  - **제거 (향후 추가 예정)**: `title`, `tags`, `commentCount`, `likeCount`, `imageUrl`
- **관련 파일**: `lib/features/snap_note/models/post_model.dart`

### 2. Firestore 연동 및 UI 리팩토링

- **목표**: 간소화된 `Post` 모델에 맞춰 Firestore 데이터 연동 로직과 관련 UI 컴포넌트를 모두 수정합니다.
- **작업 내용**:
  - `PostController`: `Post.fromFirestore` 로직이 새 모델과 호환되도록 확인합니다.
  - `PostCard`: 게시글 내용(`content`)과 작성 시간(`timestamp`)만 표시하도록 UI를 수정합니다.
  - `PostDetailScreen`: 게시글 내용(`content`)만 전체적으로 보여주도록 UI를 수정합니다.
- **관련 파일**:
  - `lib/features/snap_note/controllers/post_controller.dart`
  - `lib/features/snap_note/widgets/post_card.dart`
  - `lib/features/snap_note/screens/post_detail_screen.dart`

### 3. 중앙화된 디자인 시스템 설계

- **목표**: 앱 전체의 디자인 일관성을 유지하기 위해 색상, 타이포그래피, 테마 등을 한곳에서 관리하는 시스템을 설계하고 문서화합니다.
- **작업 내용**:
  - 기존 `lib/core/themes` 구조(`app_colors.dart`, `app_typography.dart`, `app_theme.dart`)를 검토합니다.
  - `ThemeExtension`을 활용한 색상 관리와 `AppTypography`를 통한 폰트 스타일 관리 방식을 공식화합니다.
  - 해당 디자인 시스템의 사용법을 `docs/architecture/design_system.md` 파일에 문서화하여 팀원들이 일관된 UI를 개발할 수 있도록 가이드를 제공합니다.
- **산출물**: `docs/architecture/design_system.md`
