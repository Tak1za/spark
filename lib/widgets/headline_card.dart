import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeadlineCard extends StatefulWidget {
  const HeadlineCard({Key? key}) : super(key: key);

  @override
  State<HeadlineCard> createState() => _HeadlineCardState();
}

class _HeadlineCardState extends State<HeadlineCard> {
  String? dropdownValue = "Best";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat.MMMMEEEEd().format(DateTime.now()),
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Best',
                style: Theme.of(context).textTheme.headline1,
              ),
              const Icon(Icons.sort),
            ],
          ),
        ],
      ),
    );
  }
}
