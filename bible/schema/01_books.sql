-- 성경책 정보 테이블
DROP TABLE IF EXISTS books;
CREATE TABLE books (
    book_id TEXT PRIMARY KEY,  -- '01', '02', ... '66'
    book_name TEXT NOT NULL,    -- '창세기', '출애굽기', ...
    testament TEXT NOT NULL,    -- '구약', '신약'
    book_order INTEGER NOT NULL -- 1~66
);

-- 구약 39권
INSERT INTO books VALUES('01', '창세기', '구약', 1);
INSERT INTO books VALUES('02', '출애굽기', '구약', 2);
INSERT INTO books VALUES('03', '레위기', '구약', 3);
INSERT INTO books VALUES('04', '민수기', '구약', 4);
INSERT INTO books VALUES('05', '신명기', '구약', 5);
INSERT INTO books VALUES('06', '여호수아', '구약', 6);
INSERT INTO books VALUES('07', '사사기', '구약', 7);
INSERT INTO books VALUES('08', '룻기', '구약', 8);
INSERT INTO books VALUES('09', '사무엘상', '구약', 9);
INSERT INTO books VALUES('10', '사무엘하', '구약', 10);
INSERT INTO books VALUES('11', '열왕기상', '구약', 11);
INSERT INTO books VALUES('12', '열왕기하', '구약', 12);
INSERT INTO books VALUES('13', '역대상', '구약', 13);
INSERT INTO books VALUES('14', '역대하', '구약', 14);
INSERT INTO books VALUES('15', '에스라', '구약', 15);
INSERT INTO books VALUES('16', '느헤미야', '구약', 16);
INSERT INTO books VALUES('17', '에스더', '구약', 17);
INSERT INTO books VALUES('18', '욥기', '구약', 18);
INSERT INTO books VALUES('19', '시편', '구약', 19);
INSERT INTO books VALUES('20', '잠언', '구약', 20);
INSERT INTO books VALUES('21', '전도서', '구약', 21);
INSERT INTO books VALUES('22', '아가', '구약', 22);
INSERT INTO books VALUES('23', '이사야', '구약', 23);
INSERT INTO books VALUES('24', '예레미야', '구약', 24);
INSERT INTO books VALUES('25', '예레미야애가', '구약', 25);
INSERT INTO books VALUES('26', '에스겔', '구약', 26);
INSERT INTO books VALUES('27', '다니엘', '구약', 27);
INSERT INTO books VALUES('28', '호세아', '구약', 28);
INSERT INTO books VALUES('29', '요엘', '구약', 29);
INSERT INTO books VALUES('30', '아모스', '구약', 30);
INSERT INTO books VALUES('31', '오바댜', '구약', 31);
INSERT INTO books VALUES('32', '요나', '구약', 32);
INSERT INTO books VALUES('33', '미가', '구약', 33);
INSERT INTO books VALUES('34', '나훔', '구약', 34);
INSERT INTO books VALUES('35', '하박국', '구약', 35);
INSERT INTO books VALUES('36', '스바냐', '구약', 36);
INSERT INTO books VALUES('37', '학개', '구약', 37);
INSERT INTO books VALUES('38', '스가랴', '구약', 38);
INSERT INTO books VALUES('39', '말라기', '구약', 39);

-- 신약 27권
INSERT INTO books VALUES('40', '마태복음', '신약', 40);
INSERT INTO books VALUES('41', '마가복음', '신약', 41);
INSERT INTO books VALUES('42', '누가복음', '신약', 42);
INSERT INTO books VALUES('43', '요한복음', '신약', 43);
INSERT INTO books VALUES('44', '사도행전', '신약', 44);
INSERT INTO books VALUES('45', '로마서', '신약', 45);
INSERT INTO books VALUES('46', '고린도전서', '신약', 46);
INSERT INTO books VALUES('47', '고린도후서', '신약', 47);
INSERT INTO books VALUES('48', '갈라디아서', '신약', 48);
INSERT INTO books VALUES('49', '에베소서', '신약', 49);
INSERT INTO books VALUES('50', '빌립보서', '신약', 50);
INSERT INTO books VALUES('51', '골로새서', '신약', 51);
INSERT INTO books VALUES('52', '데살로니가전서', '신약', 52);
INSERT INTO books VALUES('53', '데살로니가후서', '신약', 53);
INSERT INTO books VALUES('54', '디모데전서', '신약', 54);
INSERT INTO books VALUES('55', '디모데후서', '신약', 55);
INSERT INTO books VALUES('56', '디도서', '신약', 56);
INSERT INTO books VALUES('57', '빌레몬서', '신약', 57);
INSERT INTO books VALUES('58', '히브리서', '신약', 58);
INSERT INTO books VALUES('59', '야고보서', '신약', 59);
INSERT INTO books VALUES('60', '베드로전서', '신약', 60);
INSERT INTO books VALUES('61', '베드로후서', '신약', 61);
INSERT INTO books VALUES('62', '요한일서', '신약', 62);
INSERT INTO books VALUES('63', '요한이서', '신약', 63);
INSERT INTO books VALUES('64', '요한삼서', '신약', 64);
INSERT INTO books VALUES('65', '유다서', '신약', 65);
INSERT INTO books VALUES('66', '요한계시록', '신약', 66);
