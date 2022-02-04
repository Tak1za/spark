import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class Divider extends StatelessWidget {
  const Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: DottedLine(
        direction: Axis.horizontal,
        lineThickness: 1,
        lineLength: MediaQuery.of(context).size.width / 1.2,
        dashLength: 2,
        dashGapLength: 4,
        dashColor: Colors.grey[700]!,
      ),
    );
  }
}
