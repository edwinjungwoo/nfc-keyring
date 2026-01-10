# NFC Projects

NFC 기반 프로젝트 모음입니다.

## 📁 프로젝트

### ✝️ [Bible NFC Keyring](./bible/)

교회 권사님들을 위한 매일 바뀌는 오늘의 말씀 시스템

**주요 기능:**
- 매일 자동으로 바뀌는 성경 말씀
- NFC 태그 지원으로 스마트폰 터치만으로 말씀 확인
- 시니어 친화적 디자인 (큰 글씨, 궁서체)
- 카테고리별 말씀 (위로, 감사, 평안, 믿음, 소망, 사랑, 축복)
- 31,102개 성경 구절 데이터베이스

**기술 스택:**
- Python Flask
- SQLite3
- 반응형 웹 디자인

상세한 내용은 [bible/README.md](./bible/README.md)를 참고하세요.

---

## 🚀 빠른 시작

### Bible NFC Keyring 실행

```bash
cd bible/webapp
chmod +x run.sh
./run.sh
```

브라우저에서 `http://localhost:5000` 접속

---

## 📂 프로젝트 구조

```
nfc/
├── bible/                 # 성경 NFC 키링 프로젝트
│   ├── database/         # SQLite DB (31,102 구절)
│   ├── webapp/           # Flask 웹 앱
│   ├── schema/           # DB 스키마
│   ├── scripts/          # 유틸리티
│   └── docs/             # 문서
└── README.md             # 이 파일
```

---

## 📜 라이선스

이 프로젝트는 개인, 교회, 선교 목적으로 자유롭게 사용할 수 있습니다.
