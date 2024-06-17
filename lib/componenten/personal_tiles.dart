import 'package:flutter/material.dart';

class PersonalItem extends StatefulWidget {
  final String imagePath;
  final String personalItem;
  final String subTitle;

  const PersonalItem({
    Key? key,
    required this.imagePath,
    required this.personalItem,
    required this.subTitle,
  }) : super(key: key);

  @override
  _PersonalItemState createState() => _PersonalItemState();
}

class _PersonalItemState extends State<PersonalItem> {
  bool isFavorite = false; // State variable to track favorite status

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
                    widget.personalItem, // Gebruik personalItem in plaats van skillName
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
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.black,
              ),
              onPressed: () => setState(() {
                isFavorite = !isFavorite;
              }),
            ),
          ],
        ),
      ),
    );
  }
}