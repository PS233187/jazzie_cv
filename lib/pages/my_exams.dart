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
          iconTheme: IconThemeData(color: Colors.white), // Hiermee wordt de kleur van de terugknop (back arrow) ingesteld op wit
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: 260, // Bepaal de hoogte van de afbeelding
            width: double.infinity, // Neem de hele breedte in
            child: Image.asset(
              'assets/images/exams_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 200),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
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
                            // Voeg het juiste afbeeldingspad toe
                            examItem: 'English',
                            // Voeg de juiste persoonlijke itemnaam toe
                            subTitle: 'Passed', // Voeg de juiste subtitel toe
                          ),
                          ExamItem(
                            imagePath: 'assets/images/dutch.png',
                            // Voeg het juiste afbeeldingspad toe
                            examItem: 'Dutch',
                            // Voeg de juiste persoonlijke itemnaam toe
                            subTitle: 'Passed', // Voeg de juiste subtitel toe
                          ),
                          ExamItem(
                            imagePath: 'assets/images/digital.png',
                            // Voeg het juiste afbeeldingspad toe
                            examItem: 'digital skills',
                            // Voeg de juiste persoonlijke itemnaam toe
                            subTitle: 'Passed', // Voeg de juiste subtitel toe
                          ),
                          ExamItem(
                            imagePath: 'assets/images/figma_img.png',
                            // Voeg het juiste afbeeldingspad toe
                            examItem: 'Elective course in graphic design',
                            // Voeg de juiste persoonlijke itemnaam toe
                            subTitle: 'Passed', // Voeg de juiste subtitel toe
                          ),
                          ExamItem(
                            imagePath: 'assets/images/math.png',
                            // Voeg het juiste afbeeldingspad toe
                            examItem: 'Math',
                            // Voeg de juiste persoonlijke itemnaam toe
                            subTitle: 'Passed', // Voeg de juiste subtitel toe
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
