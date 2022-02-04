import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark/models/post.dart';

class Votes extends StatelessWidget {
  final Post post;
  const Votes(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.arrow_down_circle,
          size: 20,
          color: Theme.of(context).textTheme.headline2?.color,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          post.upvotes.toString(),
          style: Theme.of(context).textTheme.headline2?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(
          width: 5,
        ),
        Icon(
          CupertinoIcons.arrow_up_circle,
          size: 20,
          color: Theme.of(context).textTheme.headline2?.color,
        ),
      ],
    );
  }
}
