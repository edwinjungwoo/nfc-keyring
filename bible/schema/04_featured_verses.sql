-- 추천 말씀 테이블 (권사님들을 위한 은혜로운 구절들)
DROP TABLE IF EXISTS featured_verses;
CREATE TABLE featured_verses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    book TEXT NOT NULL,
    chapter NUMERIC NOT NULL,
    verse NUMERIC NOT NULL,
    category TEXT,  -- '위로', '감사', '평안', '믿음', '소망', '사랑' 등
    description TEXT,  -- 짧은 설명
    FOREIGN KEY(book, chapter, verse) REFERENCES verses(book, chapter, verse)
);

-- 카테고리별 추천 구절들 삽입
-- 위로의 말씀
INSERT INTO featured_verses (book, chapter, verse, category, description) VALUES
('19', 23, 1, '위로', '여호와는 나의 목자'),
('40', 11, 28, '위로', '수고하고 무거운 짐'),
('23', 40, 31, '위로', '독수리 날개 치며'),
('50', 4, 13, '위로', '모든 것을 할 수 있다'),
('19', 46, 1, '위로', '하나님은 우리의 피난처');

-- 감사의 말씀
INSERT INTO featured_verses (book, chapter, verse, category, description) VALUES
('52', 5, 18, '감사', '범사에 감사하라'),
('19', 107, 1, '감사', '여호와께 감사하라'),
('19', 136, 1, '감사', '인자하심이 영원함'),
('19', 100, 4, '감사', '감사함으로 들어가라');

-- 평안의 말씀
INSERT INTO featured_verses (book, chapter, verse, category, description) VALUES
('43', 14, 27, '평안', '내 평안을 너희에게'),
('50', 4, 6, '평안', '아무 것도 염려하지 말라'),
('50', 4, 7, '평안', '하나님의 평강'),
('23', 26, 3, '평안', '완전한 평강');

-- 믿음의 말씀
INSERT INTO featured_verses (book, chapter, verse, category, description) VALUES
('58', 11, 1, '믿음', '믿음은 바라는 것들의 실상'),
('41', 9, 23, '믿음', '믿는 자에게는 능치 못할 일이 없다'),
('41', 11, 22, '믿음', '하나님을 믿으라'),
('20', 3, 5, '믿음', '마음을 다하여 여호와를 의뢰하라');

-- 소망의 말씀
INSERT INTO featured_verses (book, chapter, verse, category, description) VALUES
('24', 29, 11, '소망', '너희를 향한 나의 생각'),
('45', 8, 28, '소망', '모든 것이 합력하여 선'),
('23', 41, 10, '소망', '내가 너와 함께 함'),
('19', 27, 1, '소망', '여호와는 내 빛');

-- 사랑의 말씀
INSERT INTO featured_verses (book, chapter, verse, category, description) VALUES
('43', 3, 16, '사랑', '하나님이 세상을 이처럼 사랑하사'),
('62', 4, 19, '사랑', '우리가 사랑함은'),
('46', 13, 13, '사랑', '사랑은 언제까지나'),
('62', 4, 8, '사랑', '하나님은 사랑이시라');

-- 축복의 말씀
INSERT INTO featured_verses (book, chapter, verse, category, description) VALUES
('04', 6, 24, '축복', '여호와는 복을 주시고'),
('04', 6, 25, '축복', '은혜 베푸시기를'),
('04', 6, 26, '축복', '평강 주시기를'),
('19', 128, 5, '축복', '시온에서 복을 주시고');

-- 인덱스 생성
CREATE INDEX idx_featured_category ON featured_verses(category);
