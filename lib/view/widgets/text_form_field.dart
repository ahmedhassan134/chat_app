import 'package:flutter/material.dart';

class TextFormFieldd extends StatelessWidget {
  TextFormFieldd(
      {required this.text1,
        required this.isPass,
        required this.text2,
        required this.keyboard1,
        required this.icon1,
        this.icon2,
        this.onChange,


         this.controller});

  final String text1;
  final String text2;
  TextInputType keyboard1;

  Widget icon1;
  Widget? icon2;
  TextEditingController ? controller = TextEditingController();
  bool isPass=false;
  Function(String) ?onChange;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:(String ? val) {
        if(val!.isEmpty)
        {
          return ' must be not empty';
        }
        else{
          return null;
        }

      },

      controller: controller,
      decoration: InputDecoration(
        hintText: text1,
        label: Text(text2),
        border: OutlineInputBorder(),
        prefixIcon: icon1,
        suffixIcon: icon2 ?? Container(width: 0,),
      ),
      keyboardType: keyboard1,
      obscureText:isPass==false?false:true,
      onChanged: onChange
    );
  }
}