-- 성경 NFC 키링 프로젝트 예제 쿼리들

-- 1. 특정 구절 조회 (요한복음 3:16)
SELECT
    b.book_name,
    v.chapter || '장 ' || v.verse || '절' AS reference,
    v.content
FROM verses v
JOIN books b ON v.book = b.book_id
WHERE b.book_name = '요한복음' AND v.chapter = 3 AND v.verse = 16;

-- 2. 책 번호로 구절 조회 (창세기 1:1)
SELECT
    b.book_name,
    v.chapter || ':' || v.verse AS reference,
    v.content
FROM verses v
JOIN books b ON v.book = b.book_id
WHERE v.book = '01' AND v.chapter = 1 AND v.verse = 1;

-- 3. 특정 장 전체 조회 (시편 23편)
SELECT
    v.verse || '절' AS verse_num,
    v.content
FROM verses v
JOIN books b ON v.book = b.book_id
WHERE b.book_name = '시편' AND v.chapter = 23
ORDER BY v.verse;

-- 4. 구약/신약 책 목록
SELECT
    testament AS 구분,
    COUNT(*) AS 책수
FROM books
GROUP BY testament;

-- 5. 전체 책 목록
SELECT
    book_id AS 번호,
    book_name AS 책이름,
    testament AS 구분
FROM books
ORDER BY book_order;

-- 6. NFC 태그 등록 (요한복음 3:16)
INSERT INTO nfc_tags (tag_id, tag_name, book, chapter, verse)
VALUES ('NFC-001', '요한복음 3:16 키링', '43', 3, 16);

-- 7. NFC 태그로 구절 조회
SELECT
    n.tag_name AS 태그이름,
    b.book_name || ' ' || v.chapter || ':' || v.verse AS 참조,
    v.content AS 내용,
    datetime(n.created_at, 'localtime') AS 등록일시
FROM nfc_tags n
JOIN verses v ON n.book = v.book AND n.chapter = v.chapter AND n.verse = v.verse
JOIN books b ON v.book = b.book_id
WHERE n.tag_id = 'NFC-001';

-- 8. 등록된 모든 NFC 태그 목록
SELECT
    n.tag_id AS 태그ID,
    n.tag_name AS 태그이름,
    b.book_name || ' ' || v.chapter || ':' || v.verse AS 참조,
    v.content AS 내용
FROM nfc_tags n
JOIN verses v ON n.book = v.book AND n.chapter = v.chapter AND n.verse = v.verse
JOIN books b ON v.book = b.book_id
ORDER BY n.created_at DESC;

-- 9. 키워드로 구절 검색 (예: "사랑")
SELECT
    b.book_name,
    v.chapter || ':' || v.verse AS reference,
    v.content
FROM verses v
JOIN books b ON v.book = b.book_id
WHERE v.content LIKE '%사랑%'
LIMIT 10;

-- 10. 특정 책의 총 장 수와 절 수
SELECT
    b.book_name AS 책이름,
    MAX(v.chapter) AS 총장수,
    COUNT(*) AS 총절수
FROM verses v
JOIN books b ON v.book = b.book_id
WHERE b.book_name = '창세기'
GROUP BY b.book_name;
