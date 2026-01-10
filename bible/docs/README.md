# 성경 NFC 키링 프로젝트

성경 구절을 NFC 태그에 저장하여 스마트폰으로 간편하게 읽을 수 있는 키링 프로젝트입니다.

## 프로젝트 구조

```
bible-nfc-keyring/
├── database/          # SQLite 데이터베이스 파일
├── schema/            # 데이터베이스 스키마 정의
│   ├── 01_books.sql   # 성경책 정보 (66권)
│   ├── 02_verses.sql  # 성경 본문
│   └── 03_nfc_tags.sql # NFC 태그 정보
├── scripts/           # 유틸리티 스크립트
│   └── init_database.sh # 데이터베이스 초기화
└── docs/             # 문서
```

## 데이터베이스 스키마

### 1. books 테이블
성경 66권의 정보를 담고 있습니다.

| 컬럼명 | 타입 | 설명 |
|--------|------|------|
| book_id | TEXT | 책 번호 ('01'~'66') |
| book_name | TEXT | 책 이름 (예: '창세기') |
| testament | TEXT | 구분 ('구약', '신약') |
| book_order | INTEGER | 순서 (1~66) |

### 2. verses 테이블
성경 본문을 담고 있습니다. (개역한글판)

| 컬럼명 | 타입 | 설명 |
|--------|------|------|
| book | TEXT | 책 번호 |
| chapter | NUMERIC | 장 |
| verse | NUMERIC | 절 |
| content | TEXT | 본문 내용 |

### 3. nfc_tags 테이블
NFC 태그와 성경 구절을 매핑합니다.

| 컬럼명 | 타입 | 설명 |
|--------|------|------|
| tag_id | TEXT | NFC 태그 고유 ID |
| tag_name | TEXT | 태그 이름/설명 |
| book | TEXT | 책 번호 |
| chapter | NUMERIC | 장 |
| verse | NUMERIC | 절 |
| created_at | TIMESTAMP | 생성일시 |

## 사용 방법

### 1. 데이터베이스 초기화

```bash
cd scripts
chmod +x init_database.sh
./init_database.sh
```

### 2. 성경 구절 조회

```sql
-- 요한복음 3장 16절 조회
SELECT b.book_name, v.chapter, v.verse, v.content
FROM verses v
JOIN books b ON v.book = b.book_id
WHERE v.book = '43' AND v.chapter = 3 AND v.verse = 16;
```

### 3. NFC 태그 등록

```sql
-- NFC 태그에 요한복음 3:16 연결
INSERT INTO nfc_tags (tag_id, tag_name, book, chapter, verse)
VALUES ('NFC-001', '요한복음 3:16 키링', '43', 3, 16);
```

### 4. 태그로 구절 조회

```sql
-- NFC 태그 ID로 구절 찾기
SELECT b.book_name, v.chapter, v.verse, v.content, n.tag_name
FROM nfc_tags n
JOIN verses v ON n.book = v.book AND n.chapter = v.chapter AND n.verse = v.verse
JOIN books b ON v.book = b.book_id
WHERE n.tag_id = 'NFC-001';
```

## 성경 버전

- **개역한글판** (korHRV): 순수 한글로 구성된 성경
- 출처: `SQL 입력용/개역한글판_korHRV.sql`

## 활용 아이디어

1. **말씀 키링**: 특정 구절을 NFC 키링에 저장하여 휴대
2. **QT 카드**: 매일 묵상할 말씀을 NFC 카드에 저장
3. **성경 공부**: 중요 구절을 NFC 태그로 관리
4. **선물용**: 응원/격려 구절을 담은 키링 제작

## 라이선스

이 프로젝트는 개인/교회/선교 목적으로 자유롭게 사용할 수 있습니다.
