import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark/models/post.dart';
import 'package:spark/widgets/divider.dart' as divider;

class PostDetailScreen extends StatelessWidget {
  final Post post;
  const PostDetailScreen(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Theme.of(context).colorScheme.background,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                post.previewSource != null
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.network(
                          post.previewSource!,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${post.subreddit} • ${post.author} • ${post.createdAt}",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    post.title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(CupertinoIcons.arrow_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(CupertinoIcons.bookmark),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(CupertinoIcons.chat_bubble),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(CupertinoIcons.arrow_up),
                      onPressed: () {},
                    ),
                  ],
                ),
                const divider.Divider(),
                const divider.Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
