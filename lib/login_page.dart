import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {

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
              onPressed: () {
              },
            )
          ],
        ),
      ),
    );
  }
}
