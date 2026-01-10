#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
성경 NFC 키링 - 오늘의 말씀 웹 애플리케이션
교회 권사님들을 위한 시니어 친화적 디자인
"""

from flask import Flask, render_template, jsonify
import sqlite3
import random
from datetime import datetime
import os
import webbrowser
import threading

app = Flask(__name__)

# 데이터베이스 경로
DB_PATH = os.path.join(os.path.dirname(__file__), '../database/bible.db')

def get_db_connection():
    """데이터베이스 연결"""
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

def get_daily_verse():
    """오늘의 말씀 가져오기 (매일 같은 말씀)"""
    # 오늘 날짜를 시드로 사용하여 매일 같은 구절이 나오도록
    today = datetime.now().date()
    seed = int(today.strftime('%Y%m%d'))
    random.seed(seed)

    conn = get_db_connection()

    # 추천 구절 중에서 랜덤 선택
    featured = conn.execute('''
        SELECT f.category, f.description,
               b.book_name, v.chapter, v.verse, v.content
        FROM featured_verses f
        JOIN verses v ON f.book = v.book AND f.chapter = v.chapter AND f.verse = v.verse
        JOIN books b ON v.book = b.book_id
        ORDER BY RANDOM()
        LIMIT 1
    ''').fetchone()

    conn.close()

    if featured:
        return {
            'category': featured['category'],
            'description': featured['description'],
            'book': featured['book_name'],
            'chapter': featured['chapter'],
            'verse': featured['verse'],
            'content': featured['content'],
            'reference': f"{featured['book_name']} {featured['chapter']}:{featured['verse']}"
        }
    return None

def get_random_verse():
    """완전 랜덤 말씀 가져오기"""
    conn = get_db_connection()

    verse = conn.execute('''
        SELECT b.book_name, v.chapter, v.verse, v.content
        FROM featured_verses f
        JOIN verses v ON f.book = v.book AND f.chapter = v.chapter AND f.verse = v.verse
        JOIN books b ON v.book = b.book_id
        ORDER BY RANDOM()
        LIMIT 1
    ''').fetchone()

    conn.close()

    if verse:
        return {
            'book': verse['book_name'],
            'chapter': verse['chapter'],
            'verse': verse['verse'],
            'content': verse['content'],
            'reference': f"{verse['book_name']} {verse['chapter']}:{verse['verse']}"
        }
    return None

def get_verse_by_tag(tag_id):
    """NFC 태그 ID로 말씀 가져오기"""
    conn = get_db_connection()

    result = conn.execute('''
        SELECT n.tag_name, b.book_name, v.chapter, v.verse, v.content
        FROM nfc_tags n
        JOIN verses v ON n.book = v.book AND n.chapter = v.chapter AND n.verse = v.verse
        JOIN books b ON v.book = b.book_id
        WHERE n.tag_id = ?
    ''', (tag_id,)).fetchone()

    conn.close()

    if result:
        return {
            'tag_name': result['tag_name'],
            'book': result['book_name'],
            'chapter': result['chapter'],
            'verse': result['verse'],
            'content': result['content'],
            'reference': f"{result['book_name']} {result['chapter']}:{result['verse']}"
        }
    return None

def get_category_verse(category):
    """카테고리별 말씀 가져오기"""
    conn = get_db_connection()

    result = conn.execute('''
        SELECT f.category, f.description,
               b.book_name, v.chapter, v.verse, v.content
        FROM featured_verses f
        JOIN verses v ON f.book = v.book AND f.chapter = v.chapter AND f.verse = v.verse
        JOIN books b ON v.book = b.book_id
        WHERE f.category = ?
        ORDER BY RANDOM()
        LIMIT 1
    ''', (category,)).fetchone()

    conn.close()

    if result:
        return {
            'category': result['category'],
            'description': result['description'],
            'book': result['book_name'],
            'chapter': result['chapter'],
            'verse': result['verse'],
            'content': result['content'],
            'reference': f"{result['book_name']} {result['chapter']}:{result['verse']}"
        }
    return None

@app.route('/')
def index():
    """메인 페이지 - 오늘의 말씀"""
    verse = get_daily_verse()
    today = datetime.now().strftime('%Y년 %m월 %d일')
    return render_template('index.html', verse=verse, today=today)

@app.route('/tag/<tag_id>')
def tag_verse(tag_id):
    """NFC 태그 스캔 페이지"""
    verse = get_verse_by_tag(tag_id)
    if verse:
        return render_template('tag.html', verse=verse)
    return render_template('error.html', message='등록되지 않은 태그입니다.')

@app.route('/category/<category>')
def category_verse(category):
    """카테고리별 말씀 페이지"""
    verse = get_category_verse(category)
    if verse:
        return render_template('category.html', verse=verse, category=category)
    return render_template('error.html', message='해당 카테고리의 말씀이 없습니다.')

@app.route('/random')
def random_verse():
    """랜덤 말씀 페이지"""
    verse = get_random_verse()
    return render_template('random.html', verse=verse)

@app.route('/api/daily')
def api_daily():
    """API: 오늘의 말씀"""
    verse = get_daily_verse()
    return jsonify(verse)

@app.route('/api/random')
def api_random():
    """API: 랜덤 말씀"""
    verse = get_random_verse()
    return jsonify(verse)

@app.route('/api/tag/<tag_id>')
def api_tag(tag_id):
    """API: 태그로 말씀 조회"""
    verse = get_verse_by_tag(tag_id)
    return jsonify(verse)

def open_browser():
    """서버 시작 후 브라우저 자동으로 열기"""
    import time
    time.sleep(1.5)  # 서버 시작 대기
    webbrowser.open('http://localhost:5001')

if __name__ == '__main__':
    # 브라우저 자동으로 열기
    threading.Thread(target=open_browser).start()

    print("\n" + "="*60)
    print("✝️  성경 NFC 키링 - 오늘의 말씀")
    print("="*60)
    print(f"🌐 서버 주소: http://localhost:5001")
    print(f"📱 스마트폰: http://[컴퓨터IP]:5001")
    print(f"⛔ 종료: Ctrl+C")
    print("="*60 + "\n")

    app.run(debug=True, host='0.0.0.0', port=5001, use_reloader=False)
