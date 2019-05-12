import 'package:flutter/material.dart';
import 'package:instagramclon/create_page.dart';

/**
 * Search Page
 */
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(), // body  설정
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreatePage())); // 버튼 클릭시 CreatePage로 이동
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blue, //플로팅 액션 버튼 색상 변경
      ),
    );
  }

  /**
   * body 메서드
   */
  Widget _buildBody() {
    return GridView.builder(// 그리드뷰
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //열의 개수
          childAspectRatio: 1.0, // 가로세로 비율 1.0이면 정사각형
          mainAxisSpacing: 1.0, // 미세하게 스페이스 주기
          crossAxisSpacing: 1.0, //미세하게 스페이스 주기
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildListItem(context, index);
        });
  }
  
  // 사진을 가져와서 리턴해줌
  Widget _buildListItem(context, document) {
    return Image.network(
       'http://image.sportsseoul.com/2018/05/03/news/20180503153656_%EC%97%AC%EC%9E%9011.jpg',
      fit: BoxFit.cover
    );
  }
}
