import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark/providers/auth.dart';
import 'package:spark/widgets/login.dart';

class MeScreen extends StatefulWidget {
  static const routeName = "/me";
  const MeScreen({Key? key}) : super(key: key);

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
        child: _auth.isLoggedIn ? const Text("Me") : const Login(),
      ),
    );
  }
}
