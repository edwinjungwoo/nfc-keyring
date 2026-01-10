# Vercel 배포 가이드 🚀

## ✨ Vercel이란?

- **무료 호스팅**: 개인 프로젝트 완전 무료
- **자동 배포**: Git push하면 자동으로 배포
- **빠른 속도**: 글로벌 CDN
- **HTTPS**: 자동 SSL 인증서
- **커스텀 도메인**: 무료 도메인 연결 가능

---

## 🚀 Vercel 배포 방법

### 방법 1: Vercel CLI (터미널)

#### 1. Vercel CLI 설치
```bash
npm install -g vercel
```

#### 2. 로그인
```bash
vercel login
```
이메일이나 GitHub 계정으로 로그인

#### 3. 배포
```bash
vercel
```

질문에 답변:
- Set up and deploy?: **Y**
- Which scope?: 본인 계정 선택
- Link to existing project?: **N**
- Project name: `nfc-keyring` (엔터)
- In which directory is your code located?: `./` (엔터)

완료! 배포 URL이 나타납니다:
```
https://nfc-keyring-xxx.vercel.app
```

#### 4. 프로덕션 배포
```bash
vercel --prod
```

---

### 방법 2: Vercel 웹사이트 (추천, 더 쉬움)

#### 1. Vercel 계정 만들기
1. https://vercel.com 접속
2. **Sign Up** 클릭
3. GitHub 계정으로 로그인

#### 2. GitHub 저장소 연결
1. 대시보드에서 **Add New** → **Project** 클릭
2. **Import Git Repository** 섹션에서
3. GitHub 계정 연결 (처음이면)
4. `nfc-keyring` 저장소 선택
5. **Import** 클릭

#### 3. 프로젝트 설정
- **Framework Preset**: Other (자동 감지됨)
- **Root Directory**: `docs` 선택 ← 중요!
- **Build Command**: 비워두기 (정적 사이트)
- **Output Directory**: `.` (현재 디렉토리)
- **Install Command**: 비워두기

#### 4. Deploy 클릭
2-3분 후 배포 완료!

```
https://nfc-keyring.vercel.app
```

---

## 🔄 자동 배포 설정

GitHub에 push하면 자동으로 Vercel에 배포됩니다:

```bash
git add .
git commit -m "Update content"
git push origin main
```

몇 초 후 자동으로 배포 완료! ✨

---

## 🌐 커스텀 도메인 설정

### 1. 도메인 추가
1. Vercel 프로젝트 대시보드
2. **Settings** → **Domains**
3. 도메인 입력 (예: `onaluimalsseum.com`)
4. **Add** 클릭

### 2. DNS 설정
도메인 구매한 곳(가비아, 후이즈 등)에서:

```
Type: CNAME
Name: www (또는 @)
Value: cname.vercel-dns.com
```

30분~24시간 후 도메인 연결 완료!

---

## 📱 URL 확인

배포 후 다음 URL들이 생성됩니다:

```
프로덕션: https://nfc-keyring.vercel.app
미리보기: https://nfc-keyring-xxx.vercel.app (각 커밋마다)
```

---

## 🎯 NFC 태그 URL 업데이트

Vercel 배포 후 NFC 태그에 새 URL 기록:

```
https://nfc-keyring.vercel.app
```

또는 커스텀 도메인:
```
https://onaluimalsseum.com
```

---

## 🔧 환경 변수 (필요시)

API 키나 비밀 정보가 있다면:

1. Vercel 대시보드 → **Settings** → **Environment Variables**
2. 변수 추가
3. 재배포

---

## 📊 분석 및 모니터링

Vercel에서 자동 제공:
- 방문자 수
- 페이지 로드 시간
- 배포 히스토리
- 에러 로그

대시보드에서 **Analytics** 탭 확인!

---

## 🆚 GitHub Pages vs Vercel

| 기능 | GitHub Pages | Vercel |
|------|-------------|--------|
| 가격 | 무료 | 무료 |
| 속도 | 빠름 | 매우 빠름 |
| 배포 시간 | 2-5분 | 10-30초 ⚡ |
| 커스텀 도메인 | ✅ | ✅ |
| 자동 배포 | ✅ | ✅ |
| 프리뷰 URL | ❌ | ✅ (PR마다) |
| 분석 | ❌ | ✅ |
| 서버리스 함수 | ❌ | ✅ |

**Vercel 장점**: 더 빠르고, 프리뷰 URL, 분석 제공

---

## 🐛 문제 해결

### 배포는 되는데 페이지가 안 보여요
- Root Directory가 `docs`로 설정되었는지 확인
- Vercel 대시보드에서 **Settings** → **General** → **Root Directory**

### 404 에러가 나요
```json
// vercel.json 확인
{
  "routes": [
    { "src": "/(.*)", "dest": "/docs/$1" }
  ]
}
```

### 변경사항이 반영 안 돼요
- Vercel 대시보드에서 **Deployments** 확인
- 최신 커밋이 배포되었는지 확인
- 강제 재배포: **···** → **Redeploy**

---

## 💡 Pro Tips

### 1. 브랜치별 미리보기
```bash
git checkout -b feature/new-design
git push origin feature/new-design
```
Vercel이 자동으로 미리보기 URL 생성! 🎉

### 2. 배포 알림
Vercel 프로젝트 → **Settings** → **Notifications**
- Slack 연동
- 이메일 알림

### 3. 성능 최적화
Vercel이 자동으로:
- 이미지 최적화
- 압축
- 캐싱
- CDN 배포

---

## 🎉 완료!

이제 전 세계에서 접속 가능한 무료 성경 말씀 서비스가 완성되었습니다!

**배포 URL**: `https://nfc-keyring.vercel.app`

---

## 📞 지원

- Vercel 문서: https://vercel.com/docs
- Vercel Discord: https://vercel.com/discord
- 이슈 제기: GitHub Issues

---

✝ 하나님의 말씀이 온 세상에 전파되기를 ✝
