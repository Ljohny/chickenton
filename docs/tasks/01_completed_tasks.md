# Step 1: 게시글 목록 및 상세 보기 구현

이 문서에는 SnapNote 기능의 초기 구현 단계에서 완료된 작업을 요약합니다.

## 구현된 기능

### 1. UI 및 화면 구성

- **게시글 목록 화면 (`SnapNoteScreen`)**: 여러 게시글을 카드 형태로 보여주는 기본 목록 화면을 구현했습니다.
- **게시글 상세 화면 (`PostDetailScreen`)**: 목록에서 특정 게시글을 선택했을 때 해당 게시글의 전체 내용을 보여주는 상세 화면을 구현했습니다. Figma 디자인에 따라 뒤로가기 버튼과 더보기(...) 메뉴 버튼을 포함한 앱바를 추가했습니다.

### 2. 데이터 모델링

- **`Post` 모델 (`post_model.dart`)**: 게시글 데이터를 관리하기 위한 `Post` 클래스를 정의했습니다. 이 모델에는 ID, 제목, 내용, 태그, 타임스탬프 등의 필드가 포함되어 있습니다.
- **Firestore 연동**: `Post.fromFirestore` 팩토리 메서드를 추가하여 Firestore `DocumentSnapshot`으로부터 `Post` 객체를 쉽게 생성할 수 있도록 했습니다.

### 3. 상태 관리 및 데이터 연동

- **`PostController` (`post_controller.dart`)**: Riverpod의 `AsyncNotifier`를 사용하여 Firestore `posts` 컬렉션의 데이터를 비동기적으로 불러오는 상태 관리 컨트롤러를 구현했습니다.
- **데이터 로딩 및 표시**: `SnapNoteScreen`에서 `PostController`를 `ref.watch`하여 데이터의 로딩, 성공, 에러 상태에 따라 각각 다른 UI(로딩 인디케이터, 게시글 목록, 에러 메시지)를 보여주도록 처리했습니다.

### 4. 화면 이동

- `PostCard` 위젯에 `InkWell`을 추가하여, 사용자가 게시글 카드를 탭하면 해당 게시글의 `Post` 객체를 `PostDetailScreen`으로 전달하며 화면을 이동시키는 기능을 구현했습니다.

## 관련 파일

- `lib/features/snap_note/view/snap_note_screen.dart`
- `lib/features/snap_note/screens/post_detail_screen.dart`
- `lib/features/snap_note/widgets/post_card.dart`
- `lib/features/snap_note/models/post_model.dart`
- `lib/features/snap_note/controllers/post_controller.dart`
