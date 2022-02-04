import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark/models/post.dart';

class CommentAndSave extends StatelessWidget {
  final Post post;
  const CommentAndSave(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.chat_bubble,
              size: 20,
              color: Theme.of(context).textTheme.headline2?.color,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              post.numberOfComments.toString(),
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.bookmark,
              size: 20,
              color: Theme.of(context).textTheme.headline2?.color,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "Save",
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ],
    );
  }
}
