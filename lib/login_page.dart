import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart'; //구글 로그인 사용
import 'package:firebase_auth/firebase_auth.dart'; // 파이어베이스 인증 사용
import 'package:instagramclon/tab_page.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(); //구글 로그인 추가
  final FirebaseAuth _auth = FirebaseAuth.instance; // 인증을 위해 인스턴스 프로퍼티로 객체를 얻음

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
          children: <Widget>[
            Text('Instagram Clon',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(50.0), // Padding 주기
            ),
            SignInButton(
              Buttons.Google, // 구글 로그인 버튼 추가
              onPressed: () {// 로그인 버튼 클릭시 처리
                _handleSignIn().then((user) { //비동기 요청을 then으로 파이어 베이스 유저객체를 받음
                  Navigator.pushReplacement(context, //페이지를 위로 올리고 페이지가 사라짐
                      MaterialPageRoute(builder: (context) => TabPage(user))); //로그인이 성공하면 TabPage 로 파이어베이스 유저객체를 넘김
                });
              },
            )
          ],
        ),
      ),
    );
  }

  /**
   * 구글 로그인 요청 처리
   * 응답은 파이어베이스 객체로 얻어옴
   */
  Future<FirebaseUser> _handleSignIn() async { //로그인은 비동기 요청
    GoogleSignInAccount googleUser = await _googleSignIn.signIn(); // 구글 로그인
    GoogleSignInAuthentication googleAuth = await googleUser.authentication; // 구글 로그인 인증정보 가져오기
    FirebaseUser user = await _auth.signInWithCredential( // Firebase 유저를 얻어오기
        GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken) //이메일 주소, 디스플레이 이름, 프로필 사진등의 정보를 가져옴
    );
    return user;
  }
}
