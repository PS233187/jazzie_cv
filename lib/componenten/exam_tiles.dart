import 'package:flutter/material.dart';



class ExamItem extends StatefulWidget {
  final String imagePath;
  final String examItem;
  final String subTitle;

  const ExamItem({
    Key? key,
    required this.imagePath,
    required this.examItem,
    required this.subTitle,
  }) : super(key: key);

  @override
  _ExamItemState createState() => _ExamItemState();
}

class _ExamItemState extends State<ExamItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), // Voeg borderRadius toe aan Container
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12), // Voeg borderRadius toe aan de afbeelding
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                    height: 70,
                    width: 70,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min, // Ensures the column takes minimum vertical space
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.examItem, // Gebruik personalItem in plaats van skillName
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Ink Free',
                      fontSize: 16, // Pas de lettergrootte aan zoals gewenst
                      fontWeight: FontWeight.bold, // Pas de stijl aan zoals gewenst
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    widget.subTitle, // Gebruik subTitle in plaats van percentage
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Ink Free',
                      fontSize: 14, // Pas de lettergrootte aan zoals gewenst
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
