import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//StatelessWidget 상태가 없는 위젯 - 화면이 변경될 소지가 없는 위젯
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HelloPage('Hello World'),
    );
  }
}

// stful을 입력해 상태를 가질 수 있는 위젯을 만드는 기본 형태 생성
class HelloPage extends StatefulWidget {
  final String title;

  HelloPage(this.title);

  @override
  _HelloPageState createState() => _HelloPageState();
}

//실제 화면에 그리는 역할
class _HelloPageState extends State<HelloPage> {
  // _을 붙이면 private 지우면 public
  String _message = 'Hello World';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //플로팅 액션 버튼 생성
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), //ADD 아이콘 지정
          onPressed: _changeMessage), //메세지 변경 메서드 호출
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(_message, style: TextStyle(fontSize: 30)));
  }

  void _changeMessage() {
    setState(() { // UI를 변경
      _message = '헬로 월드';
    });
  }
}
