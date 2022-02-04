import 'package:timeago/timeago.dart' as timeago;

class Post {
  final String title;
  final String subreddit;
  final String author;
  final int upvotes;
  final int numberOfComments;
  final String createdAt;
  final String? thumbnail;

  Post({
    required this.title,
    required this.subreddit,
    required this.author,
    required this.upvotes,
    required this.numberOfComments,
    required this.createdAt,
    this.thumbnail,
  });

  factory Post.fromJson(Map<String, dynamic> data) {
    final title = data['data']['title'] as String;
    final subreddit = data['data']['subreddit_name_prefixed'] as String;
    final author = "u/${(data['data']['author'] as String)}";
    final upvotes = data['data']['ups'] as int;
    final numberOfComments = data['data']['num_comments'] as int;
    final timeDouble = data['data']['created_utc'] as double;
    final createdAtUTC = DateTime.fromMillisecondsSinceEpoch(
        int.parse(timeDouble.toStringAsFixed(0)) * 1000);
    final timeDifference = DateTime.now().difference(createdAtUTC);
    final createdAtAgo = DateTime.now().subtract(timeDifference);
    final createdAt = timeago.format(createdAtAgo, locale: 'en_short');
    final thumbnail = data['data']['thumbnail_width'] == null ||
            data['data']['thumbnail'] == "default" ||
            data['data']['thumbnail'] == "nsfw" ||
            data['data']['thumbnail'] == "self"
        ? null
        : data['data']['thumbnail'];
    return Post(
      title: title,
      subreddit: subreddit,
      author: author,
      upvotes: upvotes,
      numberOfComments: numberOfComments,
      createdAt: createdAt,
      thumbnail: thumbnail,
    );
  }
}
