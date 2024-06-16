import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:scratcher/scratcher.dart';

class MyProjectsPage extends StatefulWidget {
  const MyProjectsPage({Key? key}) : super(key: key);

  @override
  _MyProjectsPageState createState() => _MyProjectsPageState();
}

class _MyProjectsPageState extends State<MyProjectsPage> {
  final scratchKey = GlobalKey<ScratcherState>();
  double _opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Projects',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: const Color(0xFF000000),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFF000000),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: ImageSlideshow(
              width: double.infinity,
              height: 150,
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              children: [
                Image.asset(
                  'assets/images/splashscreen.JPG',
                  height: 150,
                ),
                Image.asset(
                  'assets/images/samen_betalen.png',
                  height: 150,
                ),
                Image.asset(
                  'assets/images/userdiagram.png',
                  height: 150,
                ),
                Image.asset(
                  'assets/images/groenevingers.JPG',
                  height: 150,
                ),
                Image.asset(
                  'assets/images/workingout.png',
                  height: 150,
                ),
                Image.asset(
                  'assets/images/cartoon_one.png',
                  height: 150,
                ),
              ],
              onPageChanged: (value) {
                print('Page changed: $value');
              },
              autoPlayInterval: 3000,
              isLoop: true,
            ),
          ),
          SizedBox(height: 90),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: const Color(0xFF121212),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.4),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Scratcher(
                              key: scratchKey,
                              accuracy: ScratchAccuracy.medium,
                              threshold: 50,
                              onThreshold: () {
                                setState(() {
                                  _opacity = 1;
                                });
                              },
                              color: Color(0xFFA8A7A7),

                              onChange: (value) => print('Progress $value%'),
                              brushSize: 20,
                              child: AnimatedOpacity(
                                duration: Duration(milliseconds: 500),
                                opacity: _opacity,
                                child: const Image(
                                  image: AssetImage('assets/images/cartoon_scratch.png'),
                                  width: 200,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: Colors.white, // Set the color to white
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Scratch me',
                                  style: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            // Add spac e here
                            Container( // Wrap ElevatedButton with Container
                              margin: EdgeInsets.only(left: 25), // Apply margin as needed
                              child: ElevatedButton(
                                onPressed: () {
                                  scratchKey.currentState?.reset(
                                    duration: Duration(milliseconds: 2000),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                                  backgroundColor: Color(0xFF003D72),
                                ),
                                child: Text(
                                  'Reset',
                                  style: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ], // Ad
        //
      ), //
    ); //
  }
}
