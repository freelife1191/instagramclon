import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramclon/account_page.dart';
import 'package:instagramclon/home_page.dart';
import 'package:instagramclon/search_page.dart';

class TabPage extends StatefulWidget {
  final FirebaseUser user; //파이어베이스 유저를 받음
  
  TabPage(this.user);
  
  @override
  _TabPageState createState() => _TabPageState();
  
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  // 페이지
  List _pages;

  /**
   * build 하기 전에 생성 다음에 호출되는 부분
   * 초기화를 수행하는 부분
   * widget 에 있는 데이터에 접근할 수 있다
   */
  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(widget.user), //home_page.dart
      SearchPage(),
      AccountPage(widget.user), //account_page.dart
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]), //선택된 Tab index 확인
      bottomNavigationBar: BottomNavigationBar( //TabPage 아이콘 생성
          fixedColor: Colors.black, //선택 됐을 때 블랙으로 변경
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search')),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('Account')),
          ]),
    );
  }

  /**
   * 선택된 Tab index로 변경
   */
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}