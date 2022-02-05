import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class Divider extends StatelessWidget {
  final double length;

  // ignore: use_key_in_widget_constructors
  const Divider([this.length = double.infinity]);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: DottedLine(
        direction: Axis.horizontal,
        lineThickness: 1,
        lineLength: length,
        dashLength: 2,
        dashGapLength: 4,
        dashColor: Colors.grey[700]!,
      ),
    );
  }
}
