import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final FirebaseUser user;
  
  HomePage(this.user); // TabPage에서 넘겨받은 FirebaseUser 받는 생성자
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instargram Clon',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Instagram에 오신 것을 환영 합니다',
                style: TextStyle(fontSize: 24.0),
              ),
              Padding(padding: EdgeInsets.all(8.0)), //간격 조정
              Text('사진과 동영상을 보시면 팔로우하세요'),
              Padding(padding: EdgeInsets.all(16.0)), //간격 조정
              SizedBox(
                width: 260.0,
                child: Card(
                  elevation: 4.0, // 그림자 깊이 조정
                  child: Padding( // 전체 간격 넣기
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(1.0)), //간격 조정
                        SizedBox(
                          width: 80.0,
                          height: 80.0,
                          child: CircleAvatar(
//                             backgroundImage: NetworkImage('https://cdn.clien.net/web/api/file/F01/5184034/ec21fe5c349f462e816.JPEG'),
                            backgroundImage: NetworkImage(user.photoUrl), // Firebase user 프로필 사진 가져오도록
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8.0)), //간격 조정
                        Text(user.email, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(user.displayName),
                        Padding(padding: EdgeInsets.all(8.0)), //간격 조정
                        Row( // 그림 세장 오른쪽으로 나열
                          mainAxisAlignment: MainAxisAlignment.center, // 컨텐츠 가운데 정렬
                          children: <Widget>[
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network('http://www.topstarnews.net/news/photo/201803/376041_20466_3839.jpg', fit: BoxFit.cover),
                              // fit: BoxFit.cover 그림 크기 crob 조정
                            ),
                            Padding(padding: EdgeInsets.all(1.0)), // 공백 조정
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network('http://www.topstarnews.net/news/photo/201803/376041_20466_3839.jpg', fit: BoxFit.cover),
                            ),
                            Padding(padding: EdgeInsets.all(1.0)), // 공백 조정
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network('http://www.topstarnews.net/news/photo/201803/376041_20466_3839.jpg', fit: BoxFit.cover),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(4.0)), //간격 조정
                        Text('Facebook 친구'),
                        Padding(padding: EdgeInsets.all(4.0)), //간격 조정
                        RaisedButton(
                          child: Text('팔로우'),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                        Padding(padding: EdgeInsets.all(4.0)), //간격 조정
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}