import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:spark/providers/auth.dart';
import 'package:spark/screens/reddit_redirect_view.dart';
import 'package:url_launcher/url_launcher.dart';
import './themes/themes.dart' as t;

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Auth())],
      child: MaterialApp(
        title: 'Spark',
        theme: t.Theme.light(),
        darkTheme: t.Theme.dark(),
        home: Scaffold(
          body: Center(
            child: TextButton(
              onPressed: () async {
                Uri authorizationUrl = Uri.parse(
                    'https://www.reddit.com/api/v1/authorize.compact?client_id=${dotenv.env['CLIENT_ID']}&response_type=code&state=yolosolo&redirect_uri=${dotenv.env['REDIRECT_URI']}&duration=permanent&scope=identity edit flair history modconfig modflair modlog modposts modwiki mysubreddits privatemessages read report save submit subscribe vote wikiedit wikiread');

                if (await canLaunch(authorizationUrl.toString())) {
                  await launch(authorizationUrl.toString());
                }
              },
              child: const Text("Login"),
            ),
          ),
        ),
        onGenerateRoute: (settings) {
          Uri uri = Uri.parse(settings.name.toString());
          switch (uri.path) {
            case '/authorize_callback':
              {
                String query = uri.query;
                return MaterialPageRoute(
                  builder: (ctx) => RedditRedirectView(query),
                );
              }
          }
        },
      ),
    );
  }
}
