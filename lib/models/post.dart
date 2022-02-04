import 'package:timeago/timeago.dart' as timeago;

class Post {
  final String title;
  final String subreddit;
  final String author;
  final int upvotes;
  final int numberOfComments;
  final String createdAt;

  Post({
    required this.title,
    required this.subreddit,
    required this.author,
    required this.upvotes,
    required this.numberOfComments,
    required this.createdAt,
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

    return Post(
      title: title,
      subreddit: subreddit,
      author: author,
      upvotes: upvotes,
      numberOfComments: numberOfComments,
      createdAt: createdAt,
    );
  }
}
