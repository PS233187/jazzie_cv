import 'dart:math';
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class ScratchItem extends StatefulWidget {
  final String imagePath;

  const ScratchItem({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  _ScratchItemState createState() => _ScratchItemState();
}

class _ScratchItemState extends State<ScratchItem> {
  final GlobalKey<ScratcherState> scratchKey = GlobalKey<ScratcherState>();
  double _opacity = 0.0;

  void _resetScratcher() {
    setState(() {
      _opacity = 0.0;
      scratchKey.currentState?.reset(duration: Duration(milliseconds: 2000));
    });
  }

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
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFF),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.4),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Scratcher(
                          key: scratchKey,
                          accuracy: ScratchAccuracy.medium,
                          threshold: 50,
                          onThreshold: () {
                            setState(() {
                              _opacity = 1;
                            });
                          },
                          color: Color(0xff9bf0ff),
                          onChange: (value) => print('Progress $value%'),
                          brushSize: 20,
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 500),
                            opacity: _opacity,
                            child: Image.asset(
                              widget.imagePath,
                              width: 200,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _resetScratcher,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 9, horizontal: 24),
                        backgroundColor: Color(0xFF003D72),
                      ),
                      child: Text(
                        'Reset',
                        style: TextStyle(
                          color: const Color(0xFFFFFFFF),
                          fontSize: 18,
                          fontFamily: 'Ink Free',
                        ),
                      ),
                    ),
                  ],
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
                    children: [
                      Icon(
                        Icons.arrow_left,
                        color: Colors.black,
                        size: 24,
                      ),
                      Text(
                        'Tab & Scratch',
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Ink Free',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: 80,
                    child: Image.asset(
                      'assets/images/ticket_one.png',
                      fit: BoxFit.contain,
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
