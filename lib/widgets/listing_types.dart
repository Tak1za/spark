import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark/providers/listing_type.dart';
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

    return Consumer<ListingType>(
      builder: (ctx, listing, _) => Container(
        color: Theme.of(context).colorScheme.background,
        height: MediaQuery.of(context).size.height / 2,
        child: ListView.separated(
          itemBuilder: (ctx, index) => ListTile(
            leading: listingIcons[index],
            title: Text(
              listingTypes[index],
              style: const TextStyle(fontSize: 20),
            ),
            onTap: () {
              listing.setListingType(listingTypes[index]);
              Navigator.of(context).pop();
            },
          ),
          itemCount: 7,
          separatorBuilder: (ctx, index) => const divider.Divider(),
        ),
      ),
    );
  }
}
