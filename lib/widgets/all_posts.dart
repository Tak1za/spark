import 'package:flutter/material.dart';
import 'package:spark/helper/helpers.dart';
import 'package:spark/models/post.dart';
import 'package:spark/widgets/divider.dart' as divider;
import 'package:spark/widgets/post_card.dart';

class AllPosts extends StatefulWidget {
  const AllPosts({Key? key}) : super(key: key);

  @override
  State<AllPosts> createState() => _AllPostsState();
}

class _AllPostsState extends State<AllPosts> {
  late Future<void> _initPosts;
  late List<Post> _postList;

  Future<void> fetchAllPosts() async {
    _postList = await Helpers.fetchListingsOfType("Best");
  }

  Future<void> refreshAllPosts() async {
    final posts = await Helpers.fetchListingsOfType("Best");
    setState(() {
      _postList = posts;
    });
  }

  @override
  void initState() {
    super.initState();
    _initPosts = fetchAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            return RefreshIndicator(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.separated(
                  itemBuilder: (ctx, index) => PostCard(_postList[index]),
                  itemCount: _postList.length,
                  separatorBuilder: (ctx, index) => const divider.Divider(),
                ),
              ),
              onRefresh: refreshAllPosts,
            );
        }
      },
      future: _initPosts,
    );
  }
}
