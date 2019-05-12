/**
 * Created by freelife1191.good@gmail.com on 2019-05-11
 * Blog : https://freedeveloper.tistory.com/
 * Github : https://github.com/freelife1191
 */
import 'package:flutter/material.dart';

/* 사진을 클릭하면 작성자 정보와 내용을 받아서 뿌려주는 기능 */
class DetailPostPage extends StatelessWidget {
  //어떤 타입이 될지 모르면 dynamic
  final dynamic document;
  
  //document 받아오기
  DetailPostPage(this.document);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        //위에서 아래로 쭉 들어가게 하려면 Column
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //왼쪽으로 붙게
          children: <Widget>[
            Padding( //ROW 작성하기 전에 여백
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(document['userPhotoUrl']), //네트워크 이미지 가져오기
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0), //왼쪽만 padding 적용
                    child: Column( //컬럼 만들기
                      crossAxisAlignment: CrossAxisAlignment.start, //왼쪽에 붙이기
                      children: <Widget>[
                        Text(document['email'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(document['displayName'])
                      ],
                    ),
                  )
                ],
              ),
            ),
            // 게시한 사진 출력
            Image.network(document['photoUrl']),
            // 게시글 출력
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(document['contents']),
            )
          ],
        ),
      ),
    );
  }
}