import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../componenten/skill_tiles.dart';

class MyExperiencePage extends StatefulWidget {
  const MyExperiencePage({Key? key}) : super(key: key);

  @override
  _MyExperiencePageState createState() => _MyExperiencePageState();
}

class _MyExperiencePageState extends State<MyExperiencePage> {
  bool isPopupExplanationVisible = false;
  final List<Map<String, dynamic>> skills = [
    {'imagePath': 'assets/images/flutter_img.png', 'skillName': 'Flutter', 'initialPercentage': 50, 'progressBarColor': Colors.blue, 'progressBarFontSize': 15.0,},
    {'imagePath': 'assets/images/figma_img.png', 'skillName': 'Figma', 'initialPercentage': 60, 'progressBarColor': Colors.green, 'progressBarFontSize': 15.0,},
    {'imagePath': 'assets/images/js_img.png', 'skillName': 'JavaScript', 'initialPercentage': 30, 'progressBarColor': Colors.orange, 'progressBarFontSize': 15.0,},
    {'imagePath': 'assets/images/wordpress_img.png', 'skillName': 'WordPress', 'initialPercentage': 65, 'progressBarColor': Colors.purple, 'progressBarFontSize': 15.0,},
  ];

  void closePopup() {
    setState(() {
      isPopupExplanationVisible = false;
    });
  }

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
              'My experience',
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
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              if (!isPopupExplanationVisible)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPopupExplanationVisible = true;
                    });
                  },
                  child: Lottie.asset(
                    'assets/lottie/envelop_ani.json',
                    width: 200,
                    height: 200,
                    fit: BoxFit.fill,
                    repeat: true, // This will play the animation in a loop
                  ),
                ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(25),
                  color: Colors.black,
                  child: Center(
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Skills',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.more_horiz,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: skills.length,
                              itemBuilder: (context, index) {
                                return Skills(
                                  imagePath: skills[index]['imagePath'],
                                  skillName: skills[index]['skillName'],
                                  initialPercentage: skills[index]
                                      ['initialPercentage'],
                                  progressBarColor: skills[index]
                                      ['progressBarColor'],
                                  progressBarFontSize: skills[index]
                                      ['progressBarFontSize'],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (isPopupExplanationVisible)
            Positioned(
              top: 50,
              left: 50,
              right: 50,
              child: Center(
                child: Container(
                  width: 300, // Adjust if necessary
                  height: 500, // Adjust if necessary
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.9),
                        offset: Offset(0, 7),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Experience',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Basic Skills:\n',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        '• Over the past three years, I have worked on various school projects, starting with HTML and CSS.\n\n',
                                  ),
                                  TextSpan(
                                    text: 'Advanced Technologies:\n',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        '• Then the projects became more interesting with JavaScript and PHP, and we learned to work with databases in phpMyAdmin.\n\n',
                                  ),
                                  TextSpan(
                                    text: 'Laravel Projects:\n',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        '• Almost all subsequent projects were in Laravel, which further expanded my experience.\n\n',
                                  ),
                                  TextSpan(
                                    text: 'Discovery of Flutter:\n',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        '• There was one project in Flutter that convinced me that I want to become a Flutter developer. Since then, I have spent a lot of time improving my Flutter skills.\n\n',
                                  ),
                                  TextSpan(
                                    text: 'Extra Educational Assignment:\n',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        '• Last year, I completed an extra assignment to accelerate my studies, learning to use many different packages, including Firebase.\n\n',
                                  ),
                                  TextSpan(
                                    text: 'GitHub Workflows:\n',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        '• I also learned how to use GitHub Workflows to automatically run tests and upload an artifact.\n\n',
                                  ),
                                  TextSpan(
                                    text: 'Internship Experience:\n',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        '• During my internship, I worked with Figma and theme creation in WordPress.\n\n',
                                  ),
                                  TextSpan(
                                    text: 'Elective Course: Graphic Design:\n',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        '• In my Graphic Design elective course, I learned how to work with Figma.\n\n',
                                  ),
                                  TextSpan(
                                    text: 'Motivation:\n',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        '• I am highly motivated to learn all the ins and outs of Flutter and hope to do so during my internship!\n',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: IconButton(
                          onPressed: closePopup,
                          icon: Icon(Icons.close),
                          color: Colors.grey,
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
