import 'package:flutter/material.dart';
class ChatAapp extends StatelessWidget {
  const ChatAapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsetsDirectional.only(start: 14,bottom: 20,top: 10,end: 20),
          // alignment: Alignment.bottomLeft,
          // height: 60,
          // width: 220,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight:  Radius.circular(32),
                bottomRight:  Radius.circular(32),
              )




          ),
          child: Text('im a new user',style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
      )
    );
  }
}
