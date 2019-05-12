import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramclon/create_page.dart';
import 'package:instagramclon/detail_post_page.dart';

/**
 * Search Page
 */
class SearchPage extends StatefulWidget {
  final FirebaseUser user;
  
  SearchPage(this.user);
  
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
              MaterialPageRoute(builder: (context) => CreatePage(widget.user))); // 버튼 클릭시 CreatePage로 이동
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
    return StreamBuilder( //FireStore를 사용할때 StreamBuilder 활용
      stream: Firestore.instance.collection('post').snapshots(), //쿼리 스냅샷을 스트림으로 받을 수 있음
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData) { //데이터가 없다면 처리
          return Center(child: CircularProgressIndicator()); //로딩하는 표시
        }
      
        //데이터가 있다면 처리
        var items = snapshot.data?.documents ?? []; //null이면 빈 객체로 만드는 기법
      
        return GridView.builder( //그리드 뷰
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //열의 개수
              childAspectRatio: 1.0, // 가로세로 비율 1.0이면 정사각형
              mainAxisSpacing: 1.0, // 미세하게 스페이스 주기
              crossAxisSpacing: 1.0, //미세하게 스페이스 주기
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _buildListItem(context, items[index]); //아이템의 index 번째 있는 데이터를 하나씩 던짐
            });
      },
    );
  }
  
  // 사진을 가져와서 리턴해줌
  Widget _buildListItem(context, document) {
    return Hero( //그림이 커지면서 애니메이션이 적용되는 효과
      tag: document['photoUrl'],
      child: Material( //뒤돌아갈때 오류 발생 방지
        child: InkWell( // 클릭이 되고 물방울이 퍼지는 효과
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) { //화면을 이동
              return DetailPostPage(document); //상세 화면으로 document 넘겨줌
            }));
          },
          child: Image.network(
            // 'http://image.sportsseoul.com/2018/05/03/news/20180503153656_%EC%97%AC%EC%9E%9011.jpg',
              document['photoUrl'], //document의 photoUrl키에 있는 데이터 가져오기
              fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}
