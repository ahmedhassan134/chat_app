import 'package:final_graduation/view/screens/login.dart';
import 'package:final_graduation/view/screens/register.dart';
import 'package:final_graduation/view/screens/chat_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:Test.id,
      routes: {
        LoginPage.id:(context)=>LoginPage(),
        RegisterPage.id: (context)=>const RegisterPage(),
        Test.id:(context)=> Test()
      },
    );
  }
}
