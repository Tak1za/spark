import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark/widgets/divider.dart' as divider;

class ListingTypes extends StatelessWidget {
  const ListingTypes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> listingTypes = [
      "Best",
      "Controversial",
      "Hot",
      "New",
      "Random",
      "Rising",
      "Top",
    ];
    List<Icon> listingIcons = const [
      Icon(Icons.favorite),
      Icon(Icons.pest_control),
      Icon(CupertinoIcons.flame),
      Icon(Icons.fiber_new),
      Icon(CupertinoIcons.arrow_right_arrow_left),
      Icon(CupertinoIcons.arrow_up_right),
      Icon(CupertinoIcons.arrow_up),
    ];

    return ListView.separated(
      itemBuilder: (ctx, index) => ListTile(
        leading: listingIcons[index],
        title: Text(
          listingTypes[index],
          style: const TextStyle(fontSize: 20),
        ),
      ),
      itemCount: 7,
      separatorBuilder: (ctx, index) => const divider.Divider(),
    );
  }
}
