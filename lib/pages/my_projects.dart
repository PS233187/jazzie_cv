import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:scratcher/scratcher.dart';
import '../componenten/scratch_tiles.dart';

class MyProjectsPage extends StatefulWidget {
  const MyProjectsPage({Key? key}) : super(key: key);

  @override
  _MyProjectsPageState createState() => _MyProjectsPageState();
}

class _MyProjectsPageState extends State<MyProjectsPage> {
  final scratchKey = GlobalKey<ScratcherState>();
  double _opacity = 0.0;
  bool _isScratching = false;

  void _startScratching() {
    setState(() {
      _isScratching = true;
    });
  }

  void _stopScratching() {
    setState(() {
      _isScratching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF000000),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 2),
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
            backgroundColor: Colors.transparent,
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
              height: 130,
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              children: [
                Image.asset('assets/images/splashscreen.png', height: 130),
                Image.asset('assets/images/samen_betalen.png', height: 130),
                Image.asset('assets/images/userrdiagram.png', height: 130),
                Image.asset('assets/images/groenevingers.png', height: 130),
                Image.asset('assets/images/dashboard_youcare.png', height: 130),
                Image.asset('assets/images/login_youcare.png', height: 130),
                Image.asset('assets/images/eenvoud.png', height: 130),
              ],
              onPageChanged: (value) {
                print('Page changed: $value');
              },
              autoPlayInterval: 3000,
              isLoop: true,
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Fun to scratch',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff000000),
                            ),
                          ),
                          Icon(
                            Icons.favorite_border,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: _isScratching ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
                          itemCount: 3, // Number of ScratchItems
                          itemBuilder: (context, index) {
                            return ScratchItem(
                              imagePath: index == 0
                                  ? 'assets/images/cartoon_scratch.png'
                                  : index == 1
                                  ? 'assets/images/help_patato.png'
                                  : 'assets/images/hopto.png',
                            );
                          },
                        ),
                      ),
                    ],
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
