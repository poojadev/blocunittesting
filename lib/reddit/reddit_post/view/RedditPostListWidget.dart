import 'package:brawn/reddit/show_reddit_post/RedditPostView.dart';
import 'package:brawn/util/AppConstants.dart';
import 'package:flutter/material.dart';

import '../model/RedditPostsListPOJO.dart';

//toColor function will convert the string color code from response to hexColor
toColor(String hex) {
  var hexColor = hex.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
}

Widget redditPostListWidget(
    ScrollController controller, RedditPostsListPOJO? redditPostListPOJO) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      controller: controller,
      itemCount: redditPostListPOJO?.data.children.length,
      itemBuilder: (context, index) {
        return Container(
            width: MediaQuery.of(context).size.width * 0.40,
            padding: const EdgeInsets.all(10),
            child: Card(
                color: Colors.white54,
                borderOnForeground: true,
                elevation: 14,
                child: Column(
                  children: [
                    redditPostListPOJO?.data.children[index].data
                        .link_flair_background_color
                        .toString() !=
                        null
                        ? Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Card(
                          elevation: 11,
                          color: Color.alphaBlend(
                              toColor(redditPostListPOJO
                                  ?.data
                                  .children[index]
                                  .data
                                  .link_flair_background_color
                                  .toString() ??
                                  AppConstants.noBackgroundColor),
                              toColor(redditPostListPOJO
                                  ?.data
                                  .children[index]
                                  .data
                                  .link_flair_background_color
                                  .toString() ??
                                  AppConstants.noBackgroundColor)),
                          child: Text(
                            redditPostListPOJO?.data.children[index].data
                                .link_flair_text
                                .toString() ??
                                AppConstants.noText,
                            style: Theme.of(context).textTheme.bodyText1,
                          )),
                    )
                        : Container(),

                    Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: Text(
                          redditPostListPOJO?.data.children[index].data.title ??
                              AppConstants.noTitle,
                          style: Theme.of(context).textTheme.headline6,
                        )),

                    Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: Text(
                          "Score: ${redditPostListPOJO!.data.children[index].data.score}",
                          style: Theme.of(context).textTheme.bodyText2,
                        )),
                    ElevatedButton(
                      onPressed: () async {
                        var postUrl =
                            redditPostListPOJO.data.children[index].data.url;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RedditPostView(postUrl),
                          ),
                        );
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(5)),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(color: Colors.black))),
                      child: const Text('Click here to read'),
                    ),
                  ],
                )));
      });
}
