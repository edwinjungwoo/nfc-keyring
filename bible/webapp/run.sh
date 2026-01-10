#!/bin/bash

# 성경 NFC 키링 웹 애플리케이션 실행 스크립트

echo "✝️  성경 NFC 키링 웹 애플리케이션을 시작합니다..."
echo ""

# Python 버전 확인
python3 --version

# 가상환경이 있는지 확인
if [ ! -d "venv" ]; then
    echo "📦 가상환경을 생성합니다..."
    python3 -m venv venv
fi

# 가상환경 활성화
echo "🔧 가상환경을 활성화합니다..."
source venv/bin/activate

# 의존성 설치
echo "📥 필요한 패키지를 설치합니다..."
pip install -q -r requirements.txt

# 서버 실행
echo ""
echo "🌐 서버를 시작합니다..."
echo "✅ 브라우저에서 http://localhost:5000 을 열어주세요"
echo "✅ 또는 같은 와이파이의 다른 기기에서 http://[컴퓨터IP]:5000 으로 접속"
echo ""
echo "⛔ 종료하려면 Ctrl+C를 누르세요"
echo ""

python3 app.py
