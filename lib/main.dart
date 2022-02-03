import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:spark/providers/auth.dart';
import './themes/themes.dart' as t;
import 'screens/reddit_redirect_view.dart';
import 'widgets/bottom_nav.dart';

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
        home: const Scaffold(
          body: BottomNav(),
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
