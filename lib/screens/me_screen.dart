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
    return FutureBuilder(
      future: Provider.of<Auth>(context, listen: false).tryAutoLogin(),
      builder: (ctx, snapshot) => Container(
        color: Theme.of(context).colorScheme.background,
        child: Center(
          child: Consumer<Auth>(
            builder: (ctx, authData, _) => authData.isLoggedIn
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Me"),
                      ElevatedButton(
                        onPressed: () async {
                          authData.logout();
                        },
                        child: const Text("Logout"),
                      )
                    ],
                  )
                : Login(widget._controller),
          ),
        ),
      ),
    );
  }
}
