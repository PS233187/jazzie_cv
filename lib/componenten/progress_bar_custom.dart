import 'package:flutter/material.dart';

class ProgressBarCustom extends StatefulWidget {
  final String skill;
  final int initialPercentage;
  final Color color;
  final double fontSize;

  const ProgressBarCustom({
    required this.skill,
    required this.initialPercentage,
    required this.color,
    required this.fontSize,
    Key? key,
  }) : super(key: key);

  @override
  _ProgressBarCustomState createState() => _ProgressBarCustomState();
}

class _ProgressBarCustomState extends State<ProgressBarCustom> {
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
    return Container(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.skill,
                style:
                    TextStyle(color: Colors.white, fontSize: widget.fontSize),
              ),
              Text(
                '$_percentage%',
                style:
                    TextStyle(color: Colors.white, fontSize: widget.fontSize),
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
              Container(
                height: 9,
                width: (_percentage / 100) * 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: widget.color,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _decreasePercentage,
                icon: Icon(Icons.remove),
                color: Colors.white,
              ),
              IconButton(
                onPressed: _increasePercentage,
                icon: Icon(Icons.add),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
