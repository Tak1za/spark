import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/reddit.png',
            fit: BoxFit.cover,
            width: 150,
            height: 150,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Sign in to access your Reddit account, vote on posts, save posts, comment and much more!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () async {
              Uri authorizationUrl = Uri.parse(
                  'https://www.reddit.com/api/v1/authorize.compact?client_id=${dotenv.env['CLIENT_ID']}&response_type=code&state=yolosolo&redirect_uri=${dotenv.env['REDIRECT_URI']}&duration=permanent&scope=identity edit flair history modconfig modflair modlog modposts modwiki mysubreddits privatemessages read report save submit subscribe vote wikiedit wikiread');

              if (await canLaunch(authorizationUrl.toString())) {
                await launch(authorizationUrl.toString());
              }
            },
            child: Text(
              "Login using Reddit",
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "or",
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Continue browsing anonymously",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
