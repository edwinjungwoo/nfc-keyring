-- NFC 태그 정보 테이블 (선택적)
DROP TABLE IF EXISTS nfc_tags;
CREATE TABLE nfc_tags (
    tag_id TEXT PRIMARY KEY,      -- NFC 태그 고유 ID
    tag_name TEXT,                -- 태그 이름/설명
    book TEXT NOT NULL,           -- 책 번호
    chapter NUMERIC NOT NULL,     -- 장
    verse NUMERIC NOT NULL,       -- 절
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(book, chapter, verse) REFERENCES verses(book, chapter, verse)
);

CREATE INDEX idx_nfc_tags_verse ON nfc_tags(book, chapter, verse);
