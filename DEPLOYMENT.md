# GitHub Pages 배포 가이드

## 📚 정적 사이트로 전환 완료!

Flask 앱을 완전한 클라이언트 사이드 정적 사이트로 전환했습니다.
이제 GitHub Pages로 무료 배포가 가능합니다!

## 🎯 주요 변경사항

### Before (Flask 앱)
- Python 서버 필요
- 데이터베이스 쿼리
- 서버 호스팅 비용

### After (정적 사이트)
- 서버 불필요
- JSON 파일 로드
- 완전 무료 (GitHub Pages)

## 📁 파일 구조

```
docs/
├── index.html      # 메인 페이지 (JavaScript로 동적 로드)
├── verses.json     # 29개 추천 구절 데이터
└── style.css       # 시니어 친화적 스타일
```

## 🚀 GitHub Pages 배포 방법

### 1단계: GitHub에 Push

```bash
git add docs/
git commit -m "Add static site for GitHub Pages"
git push origin main
```

### 2단계: GitHub Pages 활성화

1. GitHub 저장소로 이동: `https://github.com/edwinjungwoo/nfc-keyring`
2. **Settings** 탭 클릭
3. 왼쪽 메뉴에서 **Pages** 클릭
4. **Source** 섹션에서:
   - Branch: `main` 선택
   - Folder: `/docs` 선택
5. **Save** 버튼 클릭

### 3단계: 배포 확인

몇 분 후 다음 URL에서 확인:
```
https://edwinjungwoo.github.io/nfc-keyring/
```

## ✨ 작동 원리

### 날짜 기반 시드 알고리즘

```javascript
// 오늘 날짜를 숫자로 변환 (예: 20260110)
const seed = getDateSeed();

// 해시 함수로 일관된 인덱스 생성
const index = getDailyIndex(seed, verses.length);

// 매일 같은 구절이 나옴!
const dailyVerse = verses[index];
```

### 주요 기능

1. **오늘의 말씀**: 날짜 기반으로 매일 같은 구절
2. **다른 말씀 보기**: 랜덤 구절
3. **카테고리별**: 7가지 카테고리 필터
4. **말씀 공유**: 모바일 공유 API 지원

## 📱 NFC 태그 연동

### URL 구조
```
https://edwinjungwoo.github.io/nfc-keyring/
```

### NFC 태그 설정 방법

1. **NFC Tools 앱** 설치 (iOS/Android)
2. 앱에서 **Write** 탭 선택
3. **Add a record** → **URL / URI**
4. 위 URL 입력
5. **Write** 버튼으로 태그에 기록
6. 완성! 📱✨

## 🔧 로컬 테스트

GitHub Pages에 배포하기 전에 로컬에서 테스트:

```bash
cd docs
python3 -m http.server 8000
```

브라우저에서 `http://localhost:8000` 접속

## 🎨 커스터마이징

### 구절 추가/수정

1. `verses.json` 파일 편집
2. 형식:
```json
{
  "category": "위로",
  "description": "당신을 위한 말씀",
  "book": "시편",
  "chapter": 23,
  "verse": 1,
  "content": "여호와는 나의 목자시니 내가 부족함이 없으리로다",
  "reference": "시편 23:1"
}
```

### 스타일 변경

`style.css` 파일에서:
- 폰트 크기 조정
- 색상 변경
- 레이아웃 수정

## 📊 데이터베이스는?

정적 사이트이므로 SQLite는 사용하지 않습니다.
대신 `verses.json`에 필요한 구절만 포함했습니다 (29개).

전체 성경 구절이 필요하면 Flask 버전을 사용하세요:
```
bible/webapp/app.py
```

## 🌐 커스텀 도메인 (선택사항)

### 무료 도메인 연결

1. GitHub Pages 설정에서 **Custom domain** 입력
2. DNS 설정:
   - A 레코드: GitHub Pages IP
   - CNAME 레코드: `edwinjungwoo.github.io`

예시 도메인:
- `onaluimalsseum.com` (오늘의말씀)
- `bible-keyring.org`

## 🎁 장점

✅ **무료 호스팅**: 평생 무료
✅ **빠른 속도**: CDN 제공
✅ **HTTPS**: 자동 SSL
✅ **무제한**: 트래픽 제한 없음
✅ **간단함**: 서버 관리 불필요

## 📞 문제 해결

### 페이지가 안 보여요
- GitHub Pages가 활성화되었는지 확인
- 몇 분 기다린 후 새로고침
- `/docs` 폴더가 main 브랜치에 있는지 확인

### 말씀이 안 나와요
- 개발자 도구 (F12) 열어서 콘솔 확인
- `verses.json` 파일이 있는지 확인
- CORS 에러면 GitHub Pages로 접속 (file:// 말고)

### 공유가 안 돼요
- 모바일에서는 네이티브 공유 API 사용
- 데스크톱에서는 클립보드 복사
- HTTPS 필수 (GitHub Pages는 자동)

---

## 🎉 완료!

이제 전 세계 어디서나 접속 가능한 무료 성경 말씀 서비스가 완성되었습니다!

**배포 URL**: `https://edwinjungwoo.github.io/nfc-keyring/`

---

✝ 하나님의 말씀이 온 세상에 전파되기를 ✝
