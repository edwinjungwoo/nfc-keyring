// 오늘의 말씀 - 메인 JavaScript

// 날짜 기반으로 오늘의 구절 선택
        function getTodayVerse() {
            const now = new Date();
            const year = now.getFullYear();
            const month = now.getMonth() + 1;
            const day = now.getDate();

            // 날짜를 숫자로 변환 (YYYYMMDD)
            const seed = year * 10000 + month * 100 + day;

            // 시드 기반으로 인덱스 선택
            const index = seed % verses.length;

            return verses[index];
        }

        // 날짜 포맷
        function formatDate() {
            const now = new Date();
            const year = now.getFullYear();
            const month = now.getMonth() + 1;
            const day = now.getDate();
            const weekday = ['일', '월', '화', '수', '목', '금', '토'][now.getDay()];

            return `${year}년 ${month}월 ${day}일 ${weekday}요일`;
        }

        // 페이지 초기화
        function init() {
            const verse = getTodayVerse();
            const today = formatDate();

            document.getElementById('today').textContent = today;
            document.getElementById('category').textContent = verse.category;
            document.getElementById('reference').textContent = `${verse.book_name} ${verse.chapter}:${verse.verse}`;
            document.getElementById('content').textContent = verse.content;
            // Storytelling 표시
            document.getElementById('storytelling').textContent = verse.storytelling;
            
            // Meditation 표시 (리스트 형태)
            const meditationDiv = document.getElementById('meditation');
            meditationDiv.innerHTML = '';
            
            if (verse.meditation && verse.meditation.length > 0) {
                const ul = document.createElement('ul');
                ul.className = 'meditation-list';
                
                verse.meditation.forEach((question, index) => {
                    const li = document.createElement('li');
                    li.textContent = question;
                    ul.appendChild(li);
                });
                
                meditationDiv.appendChild(ul);
            }
        }

        // 링크 복사 & 공유
        function shareLink() {
            const url = window.location.href;

            // 클립보드에 복사
            if (navigator.clipboard && navigator.clipboard.writeText) {
                navigator.clipboard.writeText(url)
                    .then(() => {
                        showToast('링크가 복사되었습니다 ✅');
                    })
                    .catch(() => {
                        fallbackCopy(url);
                    });
            } else {
                fallbackCopy(url);
            }
        }

        // 폴백 복사 방법 (구식 브라우저용)
        function fallbackCopy(text) {
            const textarea = document.createElement('textarea');
            textarea.value = text;
            textarea.style.position = 'fixed';
            textarea.style.opacity = '0';
            document.body.appendChild(textarea);
            textarea.select();

            try {
                document.execCommand('copy');
                showToast('링크가 복사되었습니다 ✅');
            } catch (err) {
                showToast('복사 실패. 다시 시도해주세요.');
            }

            document.body.removeChild(textarea);
        }

        // 토스트 메시지 표시
        function showToast(message) {
            const toast = document.getElementById('toast');
            toast.textContent = message;
            toast.classList.add('show');

            setTimeout(() => {
                toast.classList.remove('show');
            }, 3000);
        }

        init();