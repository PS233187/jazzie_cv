import 'package:flutter/material.dart';
import '../componenten/exam_tiles.dart';

class MyExamsPage extends StatefulWidget {
  const MyExamsPage({Key? key}) : super(key: key);

  @override
  _MyExamsPageState createState() => _MyExamsPageState();
}

class _MyExamsPageState extends State<MyExamsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          title: const Text(
            'My exams',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Ink Free',
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF000000),
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.0)),
          ),
          shadowColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: 260,
            width: double.infinity,
            child: Image.asset(
              'assets/images/exams_t.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 217),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.9),
                  offset: Offset(4.0, 4.0),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Center(
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Exams',
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
                      child: ListView(
                        children: [
                          ExamItem(
                            imagePath: 'assets/images/english.png',
                            examItem: 'English',
                            subTitle: 'Passed',
                          ),
                          ExamItem(
                            imagePath: 'assets/images/dutch.png',
                            examItem: 'Dutch',
                            subTitle: 'Passed',
                          ),
                          ExamItem(
                            imagePath: 'assets/images/digital.png',
                            examItem: 'digital skills',
                            subTitle: 'Passed',
                          ),
                          ExamItem(
                            imagePath: 'assets/images/figma_img.png',
                            examItem: 'Elective course in graphic design',
                            subTitle: 'Passed',
                          ),
                          ExamItem(
                            imagePath: 'assets/images/math.png',
                            examItem: 'Math',
                            subTitle: 'Passed',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
