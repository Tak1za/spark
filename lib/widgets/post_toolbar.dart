import 'package:flutter/cupertino.dart';
import 'package:spark/models/post.dart';
import 'package:spark/widgets/comment_and_save.dart';
import 'package:spark/widgets/votes.dart';

class PostToolbar extends StatelessWidget {
  final Post post;
  const PostToolbar(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommentAndSave(post),
        Votes(post),
      ],
    );
  }
}
