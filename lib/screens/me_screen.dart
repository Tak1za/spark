import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:spark/providers/auth.dart';
import 'package:spark/widgets/login.dart';

class MeScreen extends StatefulWidget {
  static const routeName = "/me";
  final PersistentTabController _controller;
  const MeScreen(this._controller, {Key? key}) : super(key: key);

  @override
  _MeScreenState createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<Auth>(context);
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: _auth.isLoggedIn ? const Text("Me") : Login(widget._controller),
      ),
    );
  }
}
