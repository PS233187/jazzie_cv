import 'package:flutter/material.dart';

class MyExamsPage extends StatefulWidget {
  const MyExamsPage({Key? key}) : super(key: key);

  @override
  _MyExamsPageState createState() => _MyExamsPageState();
}

class _MyExamsPageState extends State<MyExamsPage> {

  bool isPopupExplanationVisible = false;

  void closePopup() {
    setState(() {
      isPopupExplanationVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Exams',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: const Color(0xFF000000),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xFF000000),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Add your widgets here
        ],
      ),
    );
  }
}
