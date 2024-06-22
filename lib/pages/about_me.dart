import 'package:flutter/material.dart';
import '../componenten/personal_tiles.dart'; // Importeer PersonalTile
import 'package:intl/intl.dart';

class MyAboutmePage extends StatefulWidget {
  const MyAboutmePage({Key? key}) : super(key: key);

  @override
  _MyAboutmePageState createState() => _MyAboutmePageState();
}

class _MyAboutmePageState extends State<MyAboutmePage> {

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy').format(now);
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            title: const Text(
              'About me',
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
              'assets/images/mina_en_annie.jpg',
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
                          color: Colors.red,
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
                            personalItem: 'Family',
                            subTitle: 'The most important thing for me.',
                          ),
                          PersonalItem(
                            imagePath: 'assets/images/mina.jpg',
                            personalItem: 'My dog',
                            subTitle: 'The sweetest dog ever. Yes im a dog mom.',
                          ),
                          PersonalItem(
                            imagePath: 'assets/images/art.jpg',
                            personalItem: 'Creative',
                            subTitle: 'Coding, drawing, painting, desgining, editing there are lots of way i like to be creative!', // Voeg de juiste subtitel toe
                          ),
                          PersonalItem(
                            imagePath: 'assets/images/workingout.png',
                            personalItem: 'Working out',
                            subTitle: 'I dont like it but it does make me feel good lol.',
                          ),
                          PersonalItem(
                            imagePath: 'assets/images/cartoon_one.png',
                            personalItem: 'travel',
                            subTitle: 'Lets go today!',
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
            bottom: 600,
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
