import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: Scaffold(
        appBar: AppBar( title: Text('금호동 3가', style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 17,
        )),
        backgroundColor: Colors.white,
        elevation: 0.0, //높이, 앱바가 떠 있는 효과 없앰
        actions: [IconButton(
            icon: Icon(Icons.search, color: Colors.black,),
        onPressed: (){
              print('search button is clicked');
        },), IconButton(
            icon:Icon(Icons.menu, color: Colors.black,),
        onPressed: (){
              print('list button is clicked');
        },), IconButton(onPressed: (){
          print('Notification button is clicked');
        }, icon: Icon(Icons.notifications, color: Colors.black,)),],
        ),
        body: Container(),
        ),
    );
  }
}
