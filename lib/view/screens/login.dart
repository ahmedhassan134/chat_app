import 'package:final_graduation/view/screens/register.dart';
import 'package:final_graduation/view/screens/chat_app.dart';
import 'package:final_graduation/view/widgets/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  static String id ='loginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String ?email,passWd;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text(
            'Login',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      'LoGin',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormFieldd(
                      onChange: (data){
                        email=data;

                      },

                      isPass: false,

                      text1: 'Enter Your Email',
                      text2: 'Email',
                      keyboard1: TextInputType.emailAddress,
                      icon1: const Icon(
                        Icons.email,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormFieldd(
                      onChange: (data){
                        passWd=data;

                      },


                      isPass: true,

                      text1: 'Enter Your password',
                      text2: 'Password',
                      keyboard1: TextInputType.visiblePassword,
                      icon1: const Icon(
                        Icons.lock,
                      ),
                      icon2: const Icon(Icons.remove_red_eye),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: MaterialButton(
                        onPressed: () async{

                          if (formKey.currentState!.validate()) {
                            try{
                              UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: email!,
                                  password: passWd!
                              );
                              Navigator.pushNamed(context, Test.id);
                            }on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {

                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No user found for that email.')));
                              } else if (e.code == 'wrong-password') {

                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Wrong password provided for that user.')));
                              }
                            }


                          } else {
                            print('must no');
                          }



                        },
                        color: Colors.blue,
                        child: Text(
                          'Login in',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Dont\'t have any account?',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RegisterPage.id);
                            },
                            child: Text(
                              'Register now!',
                              style: TextStyle(color: Colors.orange, fontSize: 17),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}