import 'package:flutter/material.dart';
//import 'package:new_ui_task/home_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:screening_test/screeens/home_screen.dart';
import 'package:screening_test/screeens/phoneAuth.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int _selectedIndex = 0;
  int _questionNo = 0;
  int optionList = 0;
  var percent = 0.1;
  var _isChecked;

  @override
  final List<String> _questions = [
    "How often do you experience the pain??",
    "Which part(s) hurt?"
  ];
  final List<String> _listViewData1 = [
    "Daily",
    "Weekly",
    "Once in a while",
    "All of the time",
  ];

  final List<String> _listViewData2 = [
    "Back",
    "Shoulder",
    "Knee",
    "Neck",
  ];

  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(_listViewData2.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${percent * 100}%"),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: LinearPercentIndicator(
                      width: 300.0,
                      lineHeight: 10.0,
                      percent: percent,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      _questions[_questionNo],
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: optionList == 0
                          ? _listViewData1.length
                          : _listViewData2.length,
                      itemBuilder: (context, index) => optionList == 0
                          ? Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 60,
                                width: 400,
                                child: GestureDetector(
                                  onTap: () => onSelectIndex(index),
                                  child: Card(
                                    elevation: 10,
                                    color: _selectedIndex != null &&
                                            _selectedIndex == index
                                        ? Color(0xff66A6FF)
                                        : Colors.white,
                                    child: Center(
                                      child: Text(
                                        optionList == 0
                                            ? _listViewData1[index]
                                            : _listViewData2[index],
                                        style: TextStyle(
                                            fontSize: 20,fontWeight: FontWeight.w700,
                                            color: _selectedIndex != null &&
                                                    _selectedIndex == index
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: CheckboxListTile(
                                  contentPadding: EdgeInsets.all(10.0),
                                  // tileColor: Colors.blueAccent,
                                  selectedTileColor: Colors.blueAccent,
                                  activeColor: Colors.blueAccent,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  title: Text(_listViewData2[index],style: TextStyle(fontWeight: FontWeight.w700),),
                                  value: _isChecked[index],
                                  onChanged: (val) {
                                    setState(() {
                                      _isChecked[index] = val;
                                    });
                                  }),
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _questionNo = 1;
                        print(_questionNo);
                        percent = 0.8;
                        changeOptions();
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 180),
                      height: 50,
                      width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Color(0xff66A6FF),
                        child: Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  onSelectIndex(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  changeOptions() {
    optionList++;
    if (optionList == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
    print('OPtionsList:$optionList');
  }
}
