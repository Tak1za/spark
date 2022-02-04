import 'package:flutter/cupertino.dart';
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
            const Icon(CupertinoIcons.chat_bubble),
            const SizedBox(
              width: 5,
            ),
            Text(post.numberOfComments.toString()),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(CupertinoIcons.bookmark),
            SizedBox(
              width: 5,
            ),
            Text("Save"),
          ],
        ),
      ],
    );
  }
}
