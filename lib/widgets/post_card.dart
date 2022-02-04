import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:spark/models/post.dart';
import 'package:spark/screens/post_detail_screen.dart';
import 'package:spark/widgets/post_toolbar.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushNewScreen(
          context,
          screen: PostDetailScreen(post),
          pageTransitionAnimation: PageTransitionAnimation.slideUp,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                post.thumbnail != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 5, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            post.thumbnail!,
                            height: 50,
                            width: 50,
                          ),
                        ),
                      )
                    : Container(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${post.subreddit} • ${post.author} • ${post.createdAt}",
                          style: Theme.of(context).textTheme.headline2),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(post.title,
                          style: Theme.of(context).textTheme.headline3),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            PostToolbar(post)
          ],
        ),
      ),
    );
  }
}
