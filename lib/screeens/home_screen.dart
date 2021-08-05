import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    "assests/images/home.jpg",
    "assests/images/exercising.jpg",
    "assests/images/streching.jpg"
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xffDFECFF),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.folder_open),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xffDFECFF),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite_border,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Good Morning,",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    Text("Abhinav!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Pick up where you left")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      height: 200,
                      width: 320,
                      child: Stack(
                          // color: Colors.blueGrey,
                          children: [
                            Container(  
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  colorFilter: new ColorFilter.mode(
                                      Color(0xff5097E3).withOpacity(0.7),
                                      BlendMode.darken),
                                  image: AssetImage("assests/images/knee.jpg"),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, bottom: 10),
                                  child:
                                      Wrap(direction: Axis.vertical, children: [
                                    Text(
                                      "Exercise for knee pain",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("3 minutes left",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white70))
                                  ]),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white24,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 70,
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Wrap(children: [
                      Text(
                        'Daily Goals',
                        style: TextStyle(fontSize: 15),
                      ),
                      Icon(
                        Icons.bolt,
                        size: 20,
                      )
                    ]),
                  )
                ],
              ),
            ),
            Container(
                child: CarouselSlider(
              options: CarouselOptions(),
              items: imgList
                  .map((item) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                scale: 0.7,
                                image: AssetImage(item),
                                fit: BoxFit.fitWidth,
                                colorFilter: new ColorFilter.mode(
                                    Colors.green.withOpacity(1.0),
                                    BlendMode.darken),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Exercises",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white30,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  size: 80,
                                  color: Colors.white70,
                                )),
                          )
                        ]),
                      ))
                  .toList(),
            )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 25,
              height: 150,
              color: Colors.orangeAccent,
              child: Stack(
                children: [
                  Positioned(
                    left: 100.0,
                    top: 50,
                    child: Wrap(direction: Axis.vertical, children: [
                      Text(
                        "Get a personalised ",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        "physical therapy  programs ",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        "with daily goals ",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ]),
                  ),
                  Positioned(
                      left: 20.0,
                      top: 50,
                      child: Icon(
                        Icons.grade,
                        size: 50,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            BottomNavigationBar(
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black38,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text("Home")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.health_and_safety), title: Text("Health")),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  title: Text("Profile"),
                )
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )
          ],
        ),
      ])),
    );
  }
}
