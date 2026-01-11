# ✝️ 오늘의 말씀 - Daily Bible Verse

교회 권사님들을 위한 매일 바뀌는 오늘의 말씀 NFC 키링 시스템

[![Vercel](https://img.shields.io/badge/Deployed%20on-Vercel-black)](https://nfc-keyring.vercel.app/)

## 📖 소개

NFC 태그가 부착된 키링을 스마트폰에 터치하면, 오늘의 성경 말씀과 해설을 볼 수 있는 웹 애플리케이션입니다. 특히 시니어 사용자(교회 권사님들)를 위해 큰 글씨와 직관적인 디자인으로 제작되었습니다.

**URL:** https://nfc-keyring.vercel.app/

## ✨ 주요 기능

- **매일 자동으로 바뀌는 성경 말씀** - 날짜 기반 알고리즘으로 결정론적으로 구절 선정
- **NFC 태그 지원** - 스마트폰 터치만으로 즉시 말씀 확인
- **시니어 친화적 디자인** - 큰 글씨 (20-28px), 높은 대비, 한국 전통 서체
- **105개 엄선된 구절** - 성경 전문가가 선정한 의미 있는 말씀들
- **카테고리별 분류** - 위로(20), 평안(15), 감사(10), 사랑(15), 축복(10), 소망(10), 믿음(10), 기쁨(5), 인도(5), 회개(5)
- **깊이 있는 해설** - 각 구절마다 상황별 적용과 묵상 질문 포함
- **공유 기능** - 링크 복사로 다른 사람과 말씀 나눔

## 🎯 대상 사용자

- 교회 권사님, 집사님들
- 매일 성경 말씀을 묵상하고 싶은 분들
- NFC 기술에 익숙하지 않은 시니어 사용자들
- 간편하게 말씀을 접하고 싶은 모든 분들

## 🏗️ 기술 스택

### Frontend
- **HTML5** - 시맨틱 마크업
- **CSS3** - Flexbox, 반응형 디자인, 애니메이션
- **Vanilla JavaScript (ES6+)** - 프레임워크 없는 경량 구현

### Hosting
- **Vercel** - 정적 사이트 호스팅, CDN, HTTPS

### Fonts
- **Nanum Myeongjo (나눔명조)** - 본문용 전통 명조체
- **Noto Serif KR** - 대체 서체

## 📁 프로젝트 구조

```
bible/
├── docs/                      # 정적 웹사이트 (Vercel 배포)
│   ├── index.html            # 메인 페이지 (105개 구절 포함)
│   ├── style.css             # 스타일시트
│   └── verses_100.json       # 구절 데이터 (백업)
├── data/                      # 원본 데이터
│   └── bible_kr.sql          # 한글 성경 전체 (31,102구절)
└── README.md                  # 이 파일
```

## 🚀 로컬 실행

정적 사이트이므로 별도 서버 없이 바로 실행 가능합니다.

### 방법 1: 파일로 직접 열기
```bash
open bible/docs/index.html
```

### 방법 2: 간단한 HTTP 서버
```bash
cd bible/docs
python3 -m http.server 8000
```

그 다음 브라우저에서 `http://localhost:8000` 접속

## 📱 NFC 태그 설정 방법

1. **NFC 태그 준비** - NTAG213/215/216 권장
2. **NFC 쓰기 앱 설치** - iPhone: Shortcuts, Android: NFC Tools
3. **URL 입력** - `https://nfc-keyring.vercel.app/`
4. **NFC 태그에 쓰기**
5. **키링 부착** - 태그를 키링, 카드지갑, 스티커 등에 부착

## 🎨 디자인 특징

### 색상 팔레트
- **Primary**: #8b7355 (갈색)
- **Secondary**: #6b5344 (진한 갈색)
- **Background**: #f5f5dc (베이지)
- **Text**: #4a4a4a (진한 회색)

### 타이포그래피
- **본문**: 20px (모바일: 18px)
- **제목**: 28px (모바일: 24px)
- **구절 내용**: 24px (모바일: 22px)
- **Line Height**: 1.9-2.0 (가독성 최적화)

### 반응형 브레이크포인트
- 모바일: < 480px
- 작은 모바일: < 360px
- 가로 모드: < 600px height

## 📊 구절 선정 알고리즘

```javascript
const seed = year * 10000 + month * 100 + day;
const index = seed % verses.length;  // 105개 중 선택
```

- 날짜 기반으로 결정론적 선택
- 같은 날에는 전 세계 모든 사용자가 동일한 구절을 봄
- 약 3개월(105일) 주기로 순환

## 🔄 배포 (Vercel)

자동 배포가 설정되어 있습니다.

```bash
# 수동 배포 (필요시)
vercel --prod
```

`vercel.json` 설정:
```json
{
  "rewrites": [{ "source": "/(.*)", "destination": "/docs/index.html" }]
}
```

## 🛠️ 개발 가이드

### 구절 추가/수정

`bible/docs/index.html` 파일의 `verses` 배열을 수정:

```javascript
const verses = [
  {
    "title": "구절 제목",
    "category": "카테고리",
    "book_name": "책명",
    "chapter": 장,
    "verse": 절,
    "content": "성경 구절 내용",
    "commentary": "해설 및 묵상..."
  },
  // ...
];
```

### CSS 수정

`bible/docs/style.css` 파일에서 스타일 수정 가능

## 📈 향후 개선 사항

### Phase 2 (계획 중)
- [ ] CSS 커스텀 프로퍼티로 테마 시스템 구축
- [ ] JavaScript 에러 핸들링 추가
- [ ] 접근성 개선 (ARIA 라벨, 키보드 네비게이션)
- [ ] `user-scalable=no` 제거 (시각 장애인 고려)

### Phase 3 (계획 중)
- [ ] 다크 모드 지원
- [ ] 105개 → 365개 구절로 확장
- [ ] PWA (Progressive Web App) 지원
- [ ] 오프라인 기능

### Phase 4 (장기)
- [ ] Open Graph 메타 태그 (SNS 공유 최적화)
- [ ] Vercel Analytics 활성화
- [ ] 사용자 맞춤 카테고리 선택 기능
- [ ] 즐겨찾기 및 북마크 기능

## 📊 통계

- **구절 수**: 105개 (엄선된 명구절)
- **카테고리**: 9개
- **파일 크기**: ~26KB (JSON 데이터)
- **로딩 속도**: < 1초 (정적 사이트)
- **순환 주기**: 약 3.5개월

## 🤝 기여

이 프로젝트는 교회 사역을 위한 오픈 소스입니다. 개선 제안이나 버그 리포트는 환영합니다!

### 기여 방법
1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📜 라이선스

이 프로젝트는 개인, 교회, 선교 목적으로 자유롭게 사용할 수 있습니다.

## 🙏 감사의 말

- 성경 데이터 제공: 대한성서공회
- 개발 지원: Claude Code AI Assistant
- 호스팅: Vercel
- 웹 폰트: Google Fonts

## 📞 연락처

문의 사항이나 피드백은 GitHub Issues를 통해 남겨주세요.

---

> "주의 말씀은 내 발에 등이요 내 길에 빛이니이다" - 시편 119:105

**Made with ❤️ for 교회 권사님들**
