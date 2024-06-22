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
  bool isFavorite = false;

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
              offset: const Offset(0, 3),
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
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.personalItem,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Ink Free',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    widget.subTitle,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Ink Free',
                      fontSize: 14,
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