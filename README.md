# 🌟 Pixabay 이미지 검색앱 📸

**flutter_pixabay_image_search_app**는 를 사용해 이미지를 검색할 수 있는 Flutter 기반 이미지 검색 앱입니다.
사용자는 검색 결과를 확인하고, 클릭하여 이미지 상세 화면으로 이동할 수 있습니다.

---

## 📸 Screenshots
|메인화면|이미지상세보기|
|---------------|---------------|
|![Simulator Screenshot - iPhone 16 Pro - 2025-04-18 at 17 00 48](https://github.com/user-attachments/assets/9b834465-19e6-4797-8344-e3f1edea1631)|![Simulator Screenshot - iPhone 16 Pro - 2025-04-18 at 17 02 30](https://github.com/user-attachments/assets/d5d279c9-0a1f-4013-8fb2-5ba2b19608db)|

---

## ✨ Features

- Pixabay API를 이용해 실시간 고해상도 이미지를 검색
- 검색 결과를 워터폴(GridView) 레이아웃으로 표시
- 이미지를 클릭하여 상세 화면 이동 가능
- 검색창에 입력된 내용 유지 및 자동 재검색
- 환경 변수(.env) 파일을 사용해 API 키 관리
- 로컬 캐싱 및 비동기 통신(Freezed, GoRouter, GetIt 등 활용)

---

## 🕒 Production Duration

이 프로젝트는 **1일** 만에 완성되었습니다! ⏰  
- **주요 작업**:
  - 앱 초기 세팅
  - Pixabay API 연동 및 기본 화면 설계
  - 레이아웃 구성 및 검색 기능 추가
  - 상태 관리와 라우팅 구현

---

## ⚡ Requirements

- Flutter SDK `3.7.2` 이상
- Pixabay API Key *(API 키는 에서 발급받으세요.)*

---

## 📦 Dependencies

이 프로젝트에서는 아래의 주요 라이브러리를 사용했습니다:

| 패키지 이름            | 설명                                                   |
|------------------------|--------------------------------------------------------|
| `google_fonts`         | 다양한 구글 폰트 사용                                  |
| `json_annotation`      | JSON 직렬화/역직렬화                                   |
| `freezed`              | 데이터 클래스 생성 및 상태 관리                        |
| `go_router`            | 간단하고 구조화된 페이지 라우팅 관리                   |
| `http`                 | API 통신을 위한 HTTP 요청                              |
| `flutter_dotenv`       | 환경 변수 관리 (API 키 숨기기)                         |
| `get_it`               | 의존성 주입 도구 (Dependency Injection)                 |

---

## 🚀 Setup and Installation

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/your-username/flutter_pixabay_image_search_app.git
cd flutter_pixabay_image_search_app
```
### 2️⃣ Install Dependencies
프로젝트의 종속성을 설치합니다:
```bash
flutter pub get
```
### 3️⃣ Add .env File
앱을 실행하기 위해 Pixabay API Key가 필요합니다. .env 파일을 assets/.env 경로에 생성해야 합니다. 해당 경로는 pubspec.yaml 파일에 지정되어 있습니다.

`assets/.env` 파일의 예:
```bash
PIXABAY_KEY=your_pixabay_api_key_here
API_URL=https://pixabay.com/api/
```


---
## 🎮 Usage
1. 앱을 실행한 뒤, 검색창에 원하는 검색어를 입력합니다.
2. Enter를 누르거나 검색 아이콘을 클릭하여 이미지를 검색합니다.
3. 검색 결과는 워터폴(GridView) 레이아웃으로 표시되며, 스크롤 가능 상태입니다.
4. 이미지를 클릭하면 상세 화면이 열립니다.
