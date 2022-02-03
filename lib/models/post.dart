class Post {
  final String title;
  final String subreddit;
  final String author;
  final int upvotes;
  final int numberOfComments;

  Post({
    required this.title,
    required this.subreddit,
    required this.author,
    required this.upvotes,
    required this.numberOfComments,
  });

  factory Post.fromJson(Map<String, dynamic> data) {
    final title = data['data']['title'] as String;
    final subreddit = data['data']['subreddit_name_prefixed'] as String;
    final author = "u/${(data['data']['author'] as String)}";
    final upvotes = data['data']['ups'] as int;
    final numberOfComments = data['data']['num_comments'] as int;

    return Post(
      title: title,
      subreddit: subreddit,
      author: author,
      upvotes: upvotes,
      numberOfComments: numberOfComments,
    );
  }
}
