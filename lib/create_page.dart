import 'package:flutter/material.dart';

/**
 * Created by freelife1191.good@gmail.com on 10/03/2019
 * Blog : https://freedeveloper.tistory.com/
 * Github : https://github.com/freelife1191
 */

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

// 생성될 때 호출
class _CreatePageState extends State<CreatePage> {
  //소멸될때 dispose로 메모리를 해제 해줘야 함
  final textEditingController = TextEditingController();

  //소멸될 때 호출 dispose로 메모리를 해제
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: null,
        child: Icon(Icons.add_a_photo), // 사진 추가 버튼 추가
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
          },
        )
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView( // 스크롤이 되도록 감싸줌
      child: Column(
        children: <Widget>[
          Text('No Image'),
          TextField(
            decoration: InputDecoration(hintText: '내용을 입력하세요'), // 힌트 출력
            controller: textEditingController, // 입력하는 값을 얻어옴
          )
        ],
      ),
    );
  }
}
