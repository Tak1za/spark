import 'package:flutter/cupertino.dart';
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
        const Icon(CupertinoIcons.arrow_down_circle),
        const SizedBox(
          width: 5,
        ),
        Text(
          post.upvotes.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Icon(CupertinoIcons.arrow_up_circle),
      ],
    );
  }
}
