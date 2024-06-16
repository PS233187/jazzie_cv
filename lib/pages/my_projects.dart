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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF000000), // achtergrondkleur van de appbalk
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // kleur van de schaduw
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 2), // verplaatsing van de schaduw
              ),
            ],
          ),
          child: AppBar(
            title: Text(
              'My projects',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Ink Free',
                fontSize: 30,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent, // achtergrondkleur van de appbalk transparant maken
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.0)),
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Color(0xFF000000),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: ImageSlideshow(
              width: double.infinity,
              height: 150,
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              children: [
                Image.asset('assets/images/splashscreen.png', height: 150),
                Image.asset('assets/images/samen_betalen.png', height: 150),
                Image.asset('assets/images/userrdiagram.png', height: 150),
                Image.asset('assets/images/groenevingers.png', height: 150),
                Image.asset('assets/images/dashboard_youcare.png', height: 150),
                Image.asset('assets/images/login_youcare.png', height: 150),
                Image.asset('assets/images/eenvoud.png', height: 150),
              ],
              onPageChanged: (value) {
                print('Page changed: $value');
              },
              autoPlayInterval: 2000,
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
                        offset: Offset(0, 4),
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
                                Icon(Icons.arrow_back, color: Colors.white),
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
                            Container(
                              margin: EdgeInsets.only(left: 25),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 24),
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
        ],
      ),
    );
  }
}
