import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/**
 * Created by freelife1191.good@gmail.com on 10/03/2019
 * Blog : https://freedeveloper.tistory.com/
 * Github : https://github.com/freelife1191
 */

class CreatePage extends StatefulWidget {
  final FirebaseUser user;
  
  CreatePage(this.user);
  
  @override
  _CreatePageState createState() => _CreatePageState();
}

// 생성될 때 호출
class _CreatePageState extends State<CreatePage> {
  //소멸될때 dispose로 메모리를 해제 해줘야 함
  final textEditingController = TextEditingController();

  //사진 파일을 가져오기 위해 선
  File _image;
  
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
      floatingActionButton: FloatingActionButton(onPressed: _getImage,
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
            final firebaseStorageRef = FirebaseStorage.instance
                .ref() // 시작점
                .child('post') //경로만들기
                .child('${DateTime.now().millisecondsSinceEpoch}.png'); //저장할 이름 현재시간으로
  
            final task = firebaseStorageRef.putFile( //파일 업로드
                _image, StorageMetadata(contentType: 'image/png')); //이미지, 스토리지 메타데이터 정보 인자
  
            //Future 로 리턴이 됨
            task.onComplete.then((value) {  // Storage Task Snapshot 이 들어옴
              var downloadUrl = value.ref.getDownloadURL(); // 다운로드 URL을 Future로 얻을 수 있음
    
              //다운로드 URL을 얻으면
              downloadUrl.then((uri){
                // Firestore 데이터베이스에 post라는 컬렉션을 만든다
                var doc = Firestore.instance.collection('post').document();
                doc.setData({ // 저장할 데이터 전송
                  'id': doc.documentID,
                  'photoUrl': uri.toString(), //URL 주소
                  'contents': textEditingController.text, //컨트롤러를 통해 내용가져옴
                  'email': widget.user.email,
                  'displayName': widget.user.displayName,
                  'userPhotoUrl': widget.user.photoUrl //유저 사진 URL
                }).then((onValue) {
                  Navigator.pop(context); //완료가 되면 화면을 닫기
                });
              });
            });
          },
        )
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView( // 스크롤이 되도록 감싸줌
      child: Column(
        children: <Widget>[
          _image == null ? Text('No Image') : Image.file(_image), // 파일을 읽어서 표시
          TextField(
            decoration: InputDecoration(hintText: '내용을 입력하세요'), // 힌트 출력
            controller: textEditingController, // 입력하는 값을 얻어옴
          )
        ],
      ),
    );
  }

/**
  * 이미지 가져오기
  */
  Future _getImage() async { //비동기 처리로 이미지 받기
    // File 타입이 아니라 Future<File>의 타입이라 비동기 처리로 받아야됨
    // 사람이 클릭할때까지 기다리다가 클릭하면 비동기로 처리를 받음
    File image = await ImagePicker.pickImage(source: ImageSource.gallery); //갤러리에서 가져옴
  
    setState(() {
      _image = image;
    });
  
  }
}
