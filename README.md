# instagram_new_clon

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


## 파이어베이스 설정
https://firebase.google.com/docs/android/setup?authuser=0

### 구글 서비스 라이브러리 추가
classpath 'com.google.gms:google-services:4.2.0'

### 설정 추가
path: app - build.gradle

#### Firebase dependencies 추가
implementation 'com.google.firebase:firebase-core:16.0.9'

#### 구글 서비스 플러그인 적용 최하단에 추가
apply plugin: "com.google.gms.google-services"


에러로 인해 설정 추가

### 에러로 인해 설정 추가
path: app - build.gradle
```properties
android.useAndroidX=true
android.enableJetifier=true
```

## 구글 로그인 설정
pubspec.yaml 에 구글 로그인 설정 추가

#### 구글 로그인 추가
google_sign_in: ^4.0.1+3
#### Firebase Auth 추가
firebase_auth: ^0.8.4+5

### Firebase Authentication 설정
- Google 사용설정 사용
- 프로젝트 지원 이메얼 설정

저장

## Firebase Storage와 Firestore를 사용하여 게시물 업로드 하기

### FireStore 에 저장하기 위한 설정
pubspec.yaml 에 추가 

#### Firebase 데이터베이스
cloud_firestore: ^0.9.13+1
#### 이미지를 업로드하기 위한 저장소
firebase_storage: ^2.1.0+1

### Firebase Database
Cloud FireStore 테스트 모드로 설정

### Firebase Storage
Storage 시작하기 클릭 

## ios 셋팅
### Google 인증 동작 처리
1. Runner에 GoogleService-info.plist 파일 붙여 넣기

2. Runner - info - URL Types 추가하고 URL Schecmes 가 나오게 함

3. GoogleService-info.plist 파일의 `REVERSED_CLIENT_ID` 복사해서 `URL Schecmes`에 붙여 넣기

### XCode Build
1. Podfile에 `platform :ios, '9.0'` 설정

2. 터미널에서 `pod update` 명령어 실행해서 라이브러리 설치

3. IOS Simulator 실행