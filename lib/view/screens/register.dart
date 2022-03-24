import 'package:final_graduation/view/screens/login.dart';
import 'package:final_graduation/view/widgets/custom_gesterdetectur.dart';
import 'package:final_graduation/view/widgets/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'registerPage';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String ?email,passWd;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: formKey,
          child:  SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormFieldd(
                    onChange: (data){
                      email=data;

                    },
                    isPass: false,
                    text1: 'Enter Your Email',
                    text2: 'Email',
                    keyboard1: TextInputType.text,
                    icon1: Icon(
                      Icons.email,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormFieldd(
                    onChange: (data){
                      passWd=data;

                    },
                    isPass: true,
                    text1: 'Enter Your password',
                    text2: 'Password',
                    keyboard1: TextInputType.text,
                    icon1: Icon(
                      Icons.lock,
                    ),
                    icon2: Icon(Icons.remove_red_eye),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  CustomGesterDetectue(text: 'Register',
                  onTap: ()async {
                    if (formKey.currentState!.validate()) {
                      try{

                        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: email!,
                            password: passWd!
                        );
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Success',style: TextStyle(fontSize: 20),)));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This a Weak password')));
                        } else if (e.code == 'email-already-in-use') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('The account already exists.')));

                        }
                      } catch (e) {
                        print(e);
                      }


                    } else {
                      print('must be noo empty');
                    }


                  },),
                  Row(
                    children: [
                      Text(
                        'Already have account',
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginPage.id);
                          },
                          child: Text(
                            'Login now!',
                            style: TextStyle(color: Colors.orange, fontSize: 17),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
