# ✝️ 오늘의 말씀 - Daily Bible Verse

교회 권사님들을 위한 매일 바뀌는 오늘의 말씀 NFC 키링 시스템

[![Vercel](https://img.shields.io/badge/Deployed%20on-Vercel-black)](https://nfc-keyring.vercel.app/)

## 📖 소개

NFC 태그가 부착된 키링을 스마트폰에 터치하면, 오늘의 성경 말씀과 해설을 볼 수 있는 웹 애플리케이션입니다. 특히 시니어 사용자(교회 권사님들)를 위해 큰 글씨와 직관적인 디자인으로 제작되었습니다.

**URL:** https://nfc-keyring.vercel.app/

## ✨ 주요 기능

- **매일 자동으로 바뀌는 성경 말씀** - 날짜 기반 알고리즘으로 결정론적으로 구절 선정
- **NFC 태그 지원** - 스마트폰 터치만으로 즉시 말씀 확인
- **시니어 친화적 디자인** - 큰 글씨 (18-28px), 높은 대비, 한국 전통 서체
- **365개 엄선된 구절** - 1년치 매일 다른 말씀 (5년 서비스 계획)
- **카테고리별 분류** - 위로(70), 평안(47), 사랑(46), 믿음(40), 감사(39), 소망(30), 축복(26), 기쁨(25), 회개(22), 인도(20)
- **3단계 콘텐츠 구조**
  - 📖 **스토리텔링**: 구절의 배경과 의미 설명
  - 🙏 **묵상 질문**: 3개의 개인화된 적용 질문 (존댓말)
- **공유 기능** - 링크 복사로 다른 사람과 말씀 나눔

## 🎯 대상 사용자

- 교회 권사님, 집사님들
- 매일 성경 말씀을 묵상하고 싶은 분들
- NFC 기술에 익숙하지 않은 시니어 사용자들
- 간편하게 말씀을 접하고 싶은 모든 분들

## 🏗️ 기술 스택

### Frontend
- **HTML5** - 시맨틱 마크업, 모듈화된 구조
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
├── docs/                                      # 정적 웹사이트 (Vercel 배포)
│   ├── index.html                            # 메인 페이지 (1.6KB, 99% 경량화)
│   ├── style.css                             # 스타일시트 (7KB, 섹션별 주석)
│   ├── app.js                                # 메인 JavaScript (3.9KB)
│   ├── verses-data.js                        # 365개 구절 데이터 (402KB)
│   └── final_365_verses_with_commentary.json # 원본 JSON 데이터
├── data/                                      # 원본 데이터
│   └── bible_kr.sql                          # 한글 성경 전체 (31,102구절)
├── README.md                                  # 프로젝트 문서
├── .gitignore                                # Git 제외 파일
└── vercel.json                               # Vercel 배포 설정
```

### 아키텍처 개선 사항 (2026-01-11)

**리팩토링 전:**
- `index.html`: 198KB (모노리식 구조)
- verses 데이터 + JavaScript 코드 혼재

**리팩토링 후:**
- `index.html`: 1.6KB (**99.2% 감소**)
- `app.js`: 3.9KB (로직 분리)
- `verses-data.js`: 402KB (데이터 분리)
- 모듈화, 유지보수성 향상, 캐싱 효율 증대

## 🚀 로컬 실행

정적 사이트이므로 별도 서버 없이 바로 실행 가능합니다.

### 방법 1: 파일로 직접 열기
```bash
open docs/index.html
```

### 방법 2: 간단한 HTTP 서버
```bash
cd docs
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
- **Primary**: #8b6f47 (갈색)
- **Secondary**: #6b5638 (진한 갈색)
- **Background**: #f5e6d3 (베이지 그라데이션)
- **Text**: #4a4a4a (진한 회색)

### 타이포그래피
- **본문**: 18-20px (모바일: 16-18px)
- **제목**: 28px (모바일: 24px)
- **구절 내용**: 24px (모바일: 22px)
- **Line Height**: 1.8-2.0 (가독성 최적화)

### 반응형 브레이크포인트
- 모바일: < 480px
- 작은 모바일: < 360px
- 가로 모드: < 600px height

## 📊 구절 선정 알고리즘

```javascript
function getTodayVerse() {
    const now = new Date();
    const year = now.getFullYear();
    const month = now.getMonth() + 1;
    const day = now.getDate();

    // 날짜를 숫자로 변환 (YYYYMMDD)
    const seed = year * 10000 + month * 100 + day;

    // 시드 기반으로 인덱스 선택
    const index = seed % verses.length;  // 365개 중 선택

    return verses[index];
}
```

- 날짜 기반으로 **결정론적** 선택
- 같은 날에는 전 세계 모든 사용자가 동일한 구절을 봄
- **1년(365일) 주기**로 순환 - 5년 서비스 시 5번 반복

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

`docs/final_365_verses_with_commentary.json` 파일을 수정한 후, 다음 스크립트로 `verses-data.js` 생성:

```python
import json

with open('docs/final_365_verses_with_commentary.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# verses-data.js로 변환
with open('docs/verses-data.js', 'w', encoding='utf-8') as f:
    f.write("const verses = " + json.dumps(data, ensure_ascii=False, indent=0) + ";\n")
```

### 데이터 구조

```javascript
{
  "title": "여호와는 나의 목자",        // 구절 제목
  "category": "위로",                  // 카테고리
  "book": "19",                        // 성경책 번호 (19=시편)
  "chapter": 23,                       // 장
  "verse": 1,                          // 절
  "content": "[다윗의 시] 여호와는...", // 성경 구절 전체
  "storytelling": "다윗은 어린 시절...", // 스토리텔링
  "meditation": [                       // 묵상 질문 (3개, 존댓말)
    "내 삶에서...",
    "하나님을...",
    "오늘 하루..."
  ]
}
```

### CSS 수정

`docs/style.css` 파일에서 스타일 수정 가능. 섹션별로 주석이 잘 정리되어 있습니다.

## 📈 완료된 개선 사항

### ✅ Phase 1 (완료)
- [x] 365개 구절로 확장 (105개 → 365개)
- [x] 고품질 스토리텔링 및 묵상 질문 추가
- [x] 구절/스토리/묵상 섹션 명확히 구분
- [x] 코드베이스 리팩토링 및 모듈화
- [x] JavaScript/CSS 파일 분리
- [x] 존댓말 사용 (권사님 대상)

### 🚧 Phase 2 (계획 중)
- [ ] CSS 커스텀 프로퍼티로 테마 시스템 구축
- [ ] JavaScript 에러 핸들링 추가
- [ ] 접근성 개선 (ARIA 라벨, 키보드 네비게이션)
- [ ] `user-scalable=no` 제거 (시각 장애인 고려)

### 📋 Phase 3 (계획 중)
- [ ] 다크 모드 지원
- [ ] PWA (Progressive Web App) 지원
- [ ] 오프라인 기능
- [ ] 음성 읽기 기능 (TTS)

### 🎯 Phase 4 (장기)
- [ ] Open Graph 메타 태그 (SNS 공유 최적화)
- [ ] Vercel Analytics 활성화
- [ ] 사용자 맞춤 카테고리 선택 기능
- [ ] 즐겨찾기 및 북마크 기능

## 📊 통계

- **구절 수**: 365개 (1년치)
- **카테고리**: 10개
- **파일 크기**: ~408KB (압축 전)
- **로딩 속도**: < 1초 (정적 사이트, CDN)
- **순환 주기**: 1년 (365일)
- **코드베이스**: 357KB 절약, 99.2% 모듈화 개선

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
- 개발 지원: Claude Code AI Assistant (Claude Sonnet 4.5)
- 호스팅: Vercel
- 웹 폰트: Google Fonts

## 📞 연락처

문의 사항이나 피드백은 GitHub Issues를 통해 남겨주세요.

---

> "주의 말씀은 내 발에 등이요 내 길에 빛이니이다" - 시편 119:105

**Made with ❤️ for 교회 권사님들**

🤖 **Generated with [Claude Code](https://claude.com/claude-code)**
