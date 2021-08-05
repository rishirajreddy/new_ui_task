import 'package:flutter/material.dart';
import 'package:screening_test/screeens/otp.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Auth'),
        actions: [
          
        ],
      ),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              
              margin: EdgeInsets.only(top: 60,left: 30),
              child: Text(
                'Enter your \nPhone Number',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 6.0,left: 30),
              child: Text(
                'We will send you a 4-digit verification code',
                style: TextStyle( fontSize: 14,fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, right: 10, left: 10),
              child: TextField(
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('+91',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            )
          ]),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OTPScreen(_controller.text)));
              },
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
