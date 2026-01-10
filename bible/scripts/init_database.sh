#!/bin/bash

# 성경 NFC 키링 데이터베이스 초기화 스크립트

DB_PATH="../database/bible.db"
SCHEMA_PATH="../schema"
SQL_SOURCE_PATH="../../SQL 입력용"

echo "🔨 성경 NFC 키링 데이터베이스 초기화 중..."

# 기존 데이터베이스 삭제 (있으면)
if [ -f "$DB_PATH" ]; then
    echo "📁 기존 데이터베이스 삭제 중..."
    rm "$DB_PATH"
fi

# 스키마 생성
echo "📋 스키마 생성 중..."
sqlite3 "$DB_PATH" < "$SCHEMA_PATH/01_books.sql"
sqlite3 "$DB_PATH" < "$SCHEMA_PATH/02_verses.sql"
sqlite3 "$DB_PATH" < "$SCHEMA_PATH/03_nfc_tags.sql"

# 성경 본문 데이터 임포트
echo "📖 성경 본문 데이터 임포트 중..."
# 기존 SQL 파일의 테이블명을 변경하여 임포트
sqlite3 "$DB_PATH" < <(sed 's/bible_korHRV/verses/g' "$SQL_SOURCE_PATH/개역한글판_korHRV.sql")

echo "✅ 데이터베이스 초기화 완료!"
echo "📊 데이터베이스 위치: $DB_PATH"

# 통계 출력
echo ""
echo "📈 데이터베이스 통계:"
sqlite3 "$DB_PATH" "SELECT COUNT(*) || '개 책' FROM books;"
sqlite3 "$DB_PATH" "SELECT COUNT(*) || '개 구절' FROM verses;"
