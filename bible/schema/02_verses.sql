-- 성경 본문 테이블 (개역한글판)
DROP TABLE IF EXISTS verses;
CREATE TABLE verses (
    book TEXT NOT NULL,
    chapter NUMERIC NOT NULL,
    verse NUMERIC NOT NULL,
    content TEXT NOT NULL,
    PRIMARY KEY(book, chapter, verse),
    FOREIGN KEY(book) REFERENCES books(book_id)
);

CREATE INDEX idx_verses_book ON verses(book);
CREATE INDEX idx_verses_book_chapter ON verses(book, chapter);
