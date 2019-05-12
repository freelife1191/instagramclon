import 'package:flutter/material.dart';
import 'package:instagram_clon/account_page.dart';
import 'package:instagram_clon/home_page.dart';
import 'package:instagram_clon/search_page.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  // 텝으로 이동할 페이지 지정
  List _pages = [
    HomePage(),
    SearchPage(),
    AccountPage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]), //선택된 Tab index 확인
      bottomNavigationBar: BottomNavigationBar( //TabPage 아이콘 생성
          fixedColor: Colors.black, //선택 됐을 때 블랙으로 변
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