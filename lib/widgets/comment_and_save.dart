import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark/models/post.dart';
import 'package:spark/providers/auth.dart';

class CommentAndSave extends StatelessWidget {
  final Post post;
  const CommentAndSave(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (ctx, auth, _) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton.icon(
            onPressed: auth.isLoggedIn ? () {} : null,
            icon: Icon(
              CupertinoIcons.chat_bubble,
              size: 20,
              color: auth.isLoggedIn
                  ? Theme.of(context).textTheme.headline3?.color
                  : Theme.of(context).textTheme.headline2?.color,
            ),
            label: Text(
              post.numberOfComments.toString(),
              style: auth.isLoggedIn
                  ? Theme.of(context).textTheme.headline3
                  : Theme.of(context).textTheme.headline2,
            ),
          ),
          TextButton.icon(
            onPressed: auth.isLoggedIn ? () {} : null,
            icon: Icon(
              CupertinoIcons.bookmark,
              size: 20,
              color: auth.isLoggedIn
                  ? Theme.of(context).textTheme.headline3?.color
                  : Theme.of(context).textTheme.headline2?.color,
            ),
            label: Text(
              "Save",
              style: auth.isLoggedIn
                  ? Theme.of(context).textTheme.headline3
                  : Theme.of(context).textTheme.headline2,
            ),
          ),
        ],
      ),
    );
  }
}
