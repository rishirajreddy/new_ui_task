import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:screening_test/screeens/emojipage.dart';
import 'package:screening_test/screeens/phoneAuth.dart';
import 'package:screening_test/screeens/welcome_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Raleway",),
      home: Scaffold(body: WelcomeScreen(),),
      
    );
  }
}