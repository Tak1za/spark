import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark/models/post.dart';
import 'package:spark/providers/auth.dart';

class Votes extends StatelessWidget {
  final Post post;
  const Votes(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (ctx, auth, _) => Row(
        children: [
          IconButton(
            onPressed: auth.isLoggedIn ? () {} : null,
            icon: const Icon(
              CupertinoIcons.arrow_down,
              size: 20,
            ),
          ),
          Text(
            post.upvotes.toString(),
            style: auth.isLoggedIn
                ? Theme.of(context).textTheme.headline3?.copyWith(
                      fontWeight: FontWeight.bold,
                    )
                : Theme.of(context).textTheme.headline2?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
          ),
          IconButton(
            onPressed: auth.isLoggedIn ? () {} : null,
            icon: const Icon(
              CupertinoIcons.arrow_up,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
