import 'package:flutter/material.dart';
import 'package:spark/helper/helpers.dart';
import 'package:spark/models/post.dart';
import 'package:spark/widgets/post_card.dart';

class AllPosts extends StatelessWidget {
  const AllPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        var data = snapshot.data as List<Post>;
        return Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.separated(
            itemBuilder: (ctx, index) => PostCard(data[index]),
            itemCount: data.length,
            separatorBuilder: (ctx, index) => const Divider(
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
          ),
        );
      },
      future: Helpers.fetchListingsOfType("Best"),
    );
  }
}
