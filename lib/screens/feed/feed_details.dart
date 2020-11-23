import 'package:flutter/material.dart';
import 'package:kisanseva/models/feed_model.dart';
import 'package:kisanseva/models/app_localization.dart';
import 'package:kisanseva/models/feed_model.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedDetails extends StatelessWidget {
  final FeedModel feedModel;

  const FeedDetails({Key key, this.feedModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (AppLocalizations.of(context).translate("Feed")),
        ),
        actions: [
          FlatButton(
            color: Colors.green,
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  (AppLocalizations.of(context).translate("Bookmarks")),
                  style: TextStyle(color: Colors.black87),
                ),
                Icon(Icons.bookmark)
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feedModel.headline,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              feedModel.date,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Image.network(
              feedModel.img,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
                "Lorem ipsum dolor sit oamet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
          ],
        ),
      ),
    );
  }
}
