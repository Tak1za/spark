import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static const routeName = "/main";
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: const Center(
        child: Text("Main Screen"),
      ),
    );
  }
}
