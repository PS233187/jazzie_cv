import 'package:flutter/material.dart';
import '../componenten/emoticons.dart';
import '../componenten/personal_tiles.dart'; // Importeer PersonalTile
import '../componenten/skill_tiles.dart';
import 'package:intl/intl.dart';

class MyAboutmePage extends StatefulWidget {
  const MyAboutmePage({Key? key}) : super(key: key);

  @override
  _MyAboutmePageState createState() => _MyAboutmePageState();
}

class _MyAboutmePageState extends State<MyAboutmePage> {
  bool isPopupExplanationVisible = false;

  void closePopup() {
    setState(() {
      isPopupExplanationVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy').format(now);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About me',
          style: TextStyle(
            color: const Color(0xFFFFFFFF),
            fontSize: 30,
          ),
        ),
        backgroundColor: const Color(0xFF000000),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Color(
              0xFFFFFFFF),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: 260, // Bepaal de hoogte van de afbeelding
            width: double.infinity, // Neem de hele breedte in
            child: Image.asset(
              'assets/images/mina_en_annie.jpg',
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
                          'Personal stuff',
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
                          PersonalItem(
                            imagePath: 'assets/images/family.jpg',
                            // Voeg het juiste afbeeldingspad toe
                            personalItem: 'Family',
                            // Voeg de juiste persoonlijke itemnaam toe
                            subTitle: 'The most important thing for me.', // Voeg de juiste subtitel toe
                          ),
                          PersonalItem(
                            imagePath: 'assets/images/mina.jpg',
                            // Voeg het juiste afbeeldingspad toe
                            personalItem: 'My dog',
                            // Voeg de juiste persoonlijke itemnaam toe
                            subTitle: 'The sweetest dog ever. Yes im a dog mom.', // Voeg de juiste subtitel toe
                          ),
                          PersonalItem(
                            imagePath: 'assets/images/art.jpg',
                            // Voeg het juiste afbeeldingspad toe
                            personalItem: 'Creative',
                            // Voeg de juiste persoonlijke itemnaam toe
                            subTitle: 'Coding, drawing, painting, desgining, editing there are lots of way i like to be creative!', // Voeg de juiste subtitel toe
                          ),
                          PersonalItem(
                            imagePath: 'assets/images/workingout.png',
                            // Voeg het juiste afbeeldingspad toe
                            personalItem: 'Working out',
                            // Voeg de juiste persoonlijke itemnaam toe
                            subTitle: 'I dont like it but it does make me feel good lol.', // Voeg de juiste subtitel toe
                          ),
                          PersonalItem(
                            imagePath: 'assets/images/cartoon_one.png',
                            // Voeg het juiste afbeeldingspad toe
                            personalItem: 'travel',
                            // Voeg de juiste persoonlijke itemnaam toe
                            subTitle: 'Lets go today!', // Voeg de juiste subtitel toe
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 600, // Plaats de tekst bovenop de afbeelding
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hi, its Jasmin!',
                  style: TextStyle(
                    color: const Color(0xFFFFFFFF),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  formattedDate,
                  style: const TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}