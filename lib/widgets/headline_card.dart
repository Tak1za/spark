import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:spark/widgets/floating_modal.dart';

class HeadlineCard extends StatefulWidget {
  const HeadlineCard({Key? key}) : super(key: key);

  @override
  State<HeadlineCard> createState() => _HeadlineCardState();
}

class _HeadlineCardState extends State<HeadlineCard> {
  List<String> listingTypes = [
    "Best",
    "Controversial",
    "Hot",
    "New",
    "Random",
    "Rising",
    "Top",
  ];

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
              IconButton(
                icon: const Icon(Icons.sort),
                onPressed: () async {
                  await showFloatingModalBottomSheet(
                    context: context,
                    builder: (_) => Container(
                      color: Theme.of(context).colorScheme.background,
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView.separated(
                        itemBuilder: (ctx, index) => ListTile(
                          title: Text(
                            listingTypes[index],
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        itemCount: 7,
                        separatorBuilder: (ctx, index) => const Divider(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<T> showFloatingModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
}) async {
  final result = await showCustomModalBottomSheet(
    context: context,
    builder: builder,
    containerWidget: (_, animation, child) => FloatingModal(
      child: child,
    ),
    expand: false,
    enableDrag: false,
  );

  return result;
}
