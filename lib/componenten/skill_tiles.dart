import 'package:flutter/material.dart';

class Skills extends StatefulWidget {
  final String imagePath;
  final String skillName;
  final int initialPercentage;
  final Color progressBarColor;
  final double progressBarFontSize;

  const Skills({
    Key? key,
    required this.imagePath,
    required this.skillName,
    required this.initialPercentage,
    required this.progressBarColor,
    required this.progressBarFontSize,
  }) : super(key: key);

  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  late int _percentage;

  @override
  void initState() {
    super.initState();
    _percentage = widget.initialPercentage;
  }

  void _increasePercentage() {
    setState(() {
      if (_percentage < 100) {
        _percentage++;
      }
    });
  }

  void _decreasePercentage() {
    setState(() {
      if (_percentage > 0) {
        _percentage--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.3),
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
                padding: const EdgeInsets.all(16),
                color: Colors.blue[100],
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.skillName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: widget.progressBarFontSize,
                        ),
                      ),
                      Text(
                        '$_percentage%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: widget.progressBarFontSize,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Stack(
                    children: [
                      Container(
                        height: 9,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.white,
                        ),
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            height: 9,
                            width: (_percentage / 100) * constraints.maxWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: widget.progressBarColor,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: _decreasePercentage,
                        icon: const Icon(Icons.remove),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: _increasePercentage,
                        icon: const Icon(Icons.add),
                        color: Colors.white,
                      ),
                    ],
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
