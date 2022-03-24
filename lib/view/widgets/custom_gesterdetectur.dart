import 'package:flutter/material.dart';
class CustomGesterDetectue extends StatelessWidget {
   CustomGesterDetectue({required this.text,this.onTap}) ;

  Function()? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,

      child:  Container(
        color: Colors.blue,
        width: double.infinity,
        height: 40,
        child: Center(
          child: Text(text,style: TextStyle(color: Colors.white,fontSize: 20),),
        ),

      ),
    );
  }
}
