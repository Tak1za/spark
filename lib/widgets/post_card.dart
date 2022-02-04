import 'package:flutter/material.dart';
import 'package:spark/models/post.dart';
import 'package:spark/widgets/post_toolbar.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${post.subreddit} • ${post.author} • ${post.createdAt}",
              style: Theme.of(context).textTheme.headline2),
          const SizedBox(
            height: 10,
          ),
          Text(post.title, style: Theme.of(context).textTheme.headline3),
          const SizedBox(
            height: 20,
          ),
          PostToolbar(post),
        ],
      ),
    );
  }
}
