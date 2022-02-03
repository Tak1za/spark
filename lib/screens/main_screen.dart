import 'package:flutter/material.dart';
import 'package:spark/widgets/all_posts.dart';
import 'package:spark/widgets/headline_card.dart';

class MainScreen extends StatelessWidget {
  static const routeName = "/main";
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(5),
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: const [
            HeadlineCard(),
            Expanded(child: AllPosts()),
          ],
        ),
      ),
    );
  }
}
