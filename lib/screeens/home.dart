import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:screening_test/screeens/phoneAuth.dart';
import 'package:screening_test/screeens/welcome_screen.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String uid;
  //late String phone;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  (route) => false);
            },
          )
        ],
      ),
      body: Center(
        child: Text("Good Morning \n ${uid}"),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   uid = FirebaseAuth.instance.currentUser!.uid;
   //phone = FirebaseAuth.instance.currentUser!.phoneNumber!;
    
  }
}