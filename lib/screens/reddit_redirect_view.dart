import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark/providers/auth.dart';

class RedditRedirectView extends StatefulWidget {
  final String query;
  const RedditRedirectView(this.query, {Key? key}) : super(key: key);

  @override
  State<RedditRedirectView> createState() => _RedditRedirectViewState();
}

class _RedditRedirectViewState extends State<RedditRedirectView> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    String code = auth.extractAuthorisationCodeFromQuery(widget.query);

    return Scaffold(
      body: FutureBuilder(
        future: auth
            .setRedditAuthorisationCode(code)
            .then((_) => auth.setRedditAccessTokenFromCode(code)),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const Center(
            child: Text('All Done'),
          );
        },
      ),
    );
  }
}
