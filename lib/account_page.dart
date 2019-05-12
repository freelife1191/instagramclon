import 'package:flutter/material.dart';

/**
 * Account 페이지
 */
class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _postCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(), //코드 분리 용도로 나눔
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () { //로그아웃 버튼 처
          },
        )
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16.0), //전체적으로 padding 주기
      child: Row( // 오른쪽으로 나열하는 방식
        crossAxisAlignment: CrossAxisAlignment.start, //row 를 왼쪽 위로 정렬
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 전체적으로 공간을 주면서 정렬
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox( // 사이즈 박스 생성
                    width: 80.0,
                    height: 80.0,
                    child: CircleAvatar( // 원형 이미지 넣을 수 있는 공간
                       backgroundImage: NetworkImage('http://data.score888.com/data/photo/2017/04/296facc7e3671077dc8bc4b000c8452d_0322497a365891f8f21e954209e66dc4.gif'),
//                      backgroundImage: NetworkImage(widget.user.photoUrl), // Firebase user 프로필 사진가져오기
                    ),
                  ),
                  Container( //오른쪽아래 정렬을 주기위해 컨테이너로 감쌈
                    width: 80.0,
                    height: 80.0,
                    alignment: Alignment.bottomRight,
                    child: Stack( // floatingActionButton 뒤에 하얀색 테두리 원을 만들기위해 stack로 감싼다
                      alignment: Alignment.center, // 스텍 정렬
                      children: <Widget>[
                        SizedBox( // 뒤에 하얀색 테두리 원 생성
                          width: 28.0,
                          height: 28.0,
                          child: FloatingActionButton(onPressed: null,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.add), //아이콘추가
                          ),
                        ),
                        SizedBox( //floatingActionButton을 적당한 크기로 넣기 위해 sizedbox로 지정
                          width: 25.0,
                          height: 25.0,
                          child: FloatingActionButton(onPressed: null,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.add), //아이콘추가
                            ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0), //이름과 원형 사진 사이의 간격 조정
              ),
              Text('freelife', //'이름',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              )
            ],
          ),
          Text(
              '$_postCount\n게시물',
              textAlign: TextAlign.center, // textAlign 텍스트 속성 정렬
              style: TextStyle(fontSize: 18.0) // fontSize 주기
          ),
          Text(
              '0\n팔로워',
              textAlign: TextAlign.center, // textAlign 텍스트 속성 정렬
              style: TextStyle(fontSize: 18.0) // fontSize 주기
          ),
          Text(
              '0\n팔로잉',
              textAlign: TextAlign.center, // textAlign 텍스트 속성 정렬
              style: TextStyle(fontSize: 18.0) // fontSize 주기
          ),
        ],
      ),
    );
  }
}
