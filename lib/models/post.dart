import 'package:html_unescape/html_unescape.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:html/parser.dart';

class Post {
  final String title;
  final String subreddit;
  final String author;
  final int upvotes;
  final int numberOfComments;
  final String createdAt;
  final String? selftext;
  final String? thumbnail;
  final String? previewSource;

  Post({
    required this.title,
    required this.subreddit,
    required this.author,
    required this.upvotes,
    required this.numberOfComments,
    required this.createdAt,
    this.selftext,
    this.thumbnail,
    this.previewSource,
  });

  factory Post.fromJson(Map<String, dynamic> data) {
    var unescape = HtmlUnescape();
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
    final selftext = data['data']['selftext_html'] != null
        ? parse(unescape.convert(data['data']['selftext_html']))
            .documentElement
            ?.text
        : null;
    final thumbnailNotPresent = data['data']['thumbnail_width'] == null ||
        data['data']['thumbnail'] == "default" ||
        data['data']['thumbnail'] == "nsfw" ||
        data['data']['thumbnail'] == "self" ||
        data['data']['thumbnail'] == "spoiler" ||
        data['data']['thumbnail'] == "image";
    final previewNotPresent = data['data']['preview'] == null;
    String? thumbnail;
    if (thumbnailNotPresent && previewNotPresent) {
      thumbnail = null;
    } else if (!previewNotPresent) {
      final resolutionList =
          data['data']['preview']['images'][0]['resolutions'] as List<dynamic>;
      thumbnail = resolutionList.first['url'];
    } else {
      thumbnail = data['data']['thumbnail'];
    }
    final previewSource = previewNotPresent
        ? null
        : data['data']['preview']['images'][0]['source']['url'];
    return Post(
      title: title,
      subreddit: subreddit,
      author: author,
      upvotes: upvotes,
      numberOfComments: numberOfComments,
      createdAt: createdAt,
      selftext: selftext,
      thumbnail: thumbnail,
      previewSource: previewSource,
    );
  }
}
