import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:screening_test/screeens/home.dart';
import 'package:screening_test/screeens/home_screen.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class EmojiPage extends StatefulWidget {
  @override
  _EmojiPageState createState() => _EmojiPageState();
}

class _EmojiPageState extends State<EmojiPage> {
  var myFeedbackText = "No Pain";
  var sliderValue = 0.0;
  IconData myFeedback = FontAwesomeIcons.sadTear;
  Color myFeedbackColor = Colors.red;
  Color backGroundColor = Color(0xFF69F0AE);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      body: Container(
        color: backGroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(child:Container(
                  
                  child: Text("HealthMeter",
                  style: TextStyle(color: Colors.black, fontSize: 22.0,fontWeight:FontWeight.bold),)),),
                Container(child:Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text("How are you feeling today?",
                  style: TextStyle(color: Colors.black, fontSize: 16.0),)),),
              ],
            ),
            
            Align(
              child: Container(
                  width: 350.0,
                  height: 400.0,
                  child: Column(children: <Widget>[
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(child: Icon(
                        myFeedback, color: myFeedbackColor, size: 100.0,)),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(child: Text(myFeedbackText,
                    //     style: TextStyle(color: Colors.black, fontSize: 22.0),)),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        
                        child: SleekCircularSlider(
                        
                        min: 0.0,
                        max: 10.0,
                        initialValue: 0.0,
                        
                        appearance: CircularSliderAppearance(
                          size: 200,
                          customWidths: CustomSliderWidths(trackWidth: 16,handlerSize: 10,progressBarWidth: 18) ,
                          customColors:  CustomSliderColors(trackColor: Colors.grey,progressBarColor:Colors.white,dotColor: myFeedbackColor,
                    
    
                          ),infoProperties: InfoProperties(bottomLabelText: myFeedbackText)
                        ),
                        
                        onChange: (newValue) {
                          setState(() {
                            sliderValue = newValue;
                            if (sliderValue >= 0.0 && sliderValue <= 2.0) {
                              myFeedback = FontAwesomeIcons.laugh;
                              myFeedbackColor = Colors.red;
                              myFeedbackText = "No Pain";
                              backGroundColor = Color(0xFF69F0AE);
                              
                            }
                            if (sliderValue >= 2.1 && sliderValue <= 4.0) {
                              myFeedback = FontAwesomeIcons.smile;
                              myFeedbackColor = Colors.yellow;
                              myFeedbackText = "Negligible Pain";
                              backGroundColor = Color(0xFFE6EE96);
                            }
                            if (sliderValue >= 4.1 && sliderValue <= 6.0) {
                              myFeedback = FontAwesomeIcons.meh;
                              myFeedbackColor = Colors.amber;
                              myFeedbackText = "Mild Pain";
                              backGroundColor = Color(0xFFFFF59D);
                            }
                            if (sliderValue >= 6.1 && sliderValue <= 8.0) {
                              myFeedback = FontAwesomeIcons.frown;
                              myFeedbackColor = Colors.green;
                              myFeedbackText = "Moderate Pain";
                              backGroundColor = Color(0xFFFF8A65);
                            }
                            if (sliderValue >= 8.1 && sliderValue <= 10.0) {
                              myFeedback = FontAwesomeIcons.sadTear;
                              myFeedbackColor = Colors.pink;
                              myFeedbackText = "Severe Pain";
                              backGroundColor = Color(0xFFFF8A80);
                            }
                          });
                        },
                      ),),
                    ),
                    
                   Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeScreen()));
              },
              child: Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
                  ],)
              ),
            ),
          ],
        ),
      ),
    );
  }
}