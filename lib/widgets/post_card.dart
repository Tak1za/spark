import 'package:flutter/material.dart';
import 'package:spark/models/post.dart';

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
          Text("${post.subreddit} - ${post.author}",
              style: Theme.of(context).textTheme.headline2),
          const SizedBox(
            height: 10,
          ),
          Text(post.title, style: Theme.of(context).textTheme.headline3),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.chat_bubble_outline),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(post.numberOfComments.toString()),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.bookmark_add_outlined),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("Save"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.keyboard_arrow_up_rounded),
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
                  const Icon(Icons.keyboard_arrow_down_rounded),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
