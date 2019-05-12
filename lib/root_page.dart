import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramclon/login_page.dart';
import 'package:instagramclon/tab_page.dart';

/**
 * 메인에서 가장 먼저 호출되는 페이지
 */
class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>( //리액티브 프로그래밍
      stream: FirebaseAuth.instance.onAuthStateChanged, //인증이 되거나 끊어졌을 때 상태가 변경이 되면서 변경된 상태에 따라 snapshot이 흘러들어옴
      builder: (BuildContext context, AsyncSnapshot snapshot) { //snapshot은 Firebase 유저정보가 들어옴
        if(snapshot.hasData) { // 데이터를 가지고 있는지 확인(로그인이 성공했으면 데이터가 들어있고 실패 했으면 들어있지 않음)
          return TabPage(snapshot.data); // 있으면 페이지로 이동 TapPage는 Firebase 유저를 받음 dynamic은 Java의 Object와 같음
        } else {
          return LoginPage(); // 없으면 로그인 페이지
        }
      },
    );
  }
}
