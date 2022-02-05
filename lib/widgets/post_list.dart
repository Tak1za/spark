import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark/helper/helpers.dart';
import 'package:spark/models/post.dart';
import 'package:spark/providers/listing_type.dart';
import 'package:spark/widgets/divider.dart' as divider;
import 'package:spark/widgets/post_card.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  late List<Post> _postList;

  Future<void> fetchAllPosts(String type) async {
    _postList = await Helpers.fetchListingsOfType(type);
  }

  Future<void> refreshAllPosts(String type) async {
    final posts = await Helpers.fetchListingsOfType(type);
    setState(() {
      _postList = posts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ListingType>(
      builder: (ctx, listing, _) => FutureBuilder(
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.separated(
                    itemBuilder: (ctx, index) => PostCard(_postList[index]),
                    itemCount: _postList.length,
                    separatorBuilder: (ctx, index) => const divider.Divider(),
                  ),
                ),
                onRefresh: () => refreshAllPosts(listing.listingType),
              );
          }
        },
        future: fetchAllPosts(listing.listingType),
      ),
    );
  }
}
