import 'dart:io';

import 'package:brawn/util/AppConstants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../util/InternetStatus.dart';

class RedditPostView extends StatefulWidget {
 final String postUrl;
  const RedditPostView(this.postUrl, {super.key});
  @override
  _RedditPostViewState createState() => _RedditPostViewState();
}

class _RedditPostViewState extends State<RedditPostView> {
  bool isLoading=true;
  Map _source = {ConnectivityResult.none: false};
  final InternetStatus connectivity = InternetStatus.instance;
  @override
  void initState() {
    // TODO: implement initState
    connectivity.initialise();
    connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
    super.initState();
  }
  final _key = UniqueKey();
  late String  internetConnectionStatus;

  @override
  Widget build(BuildContext context) {
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.mobile:
        internetConnectionStatus = AppConstants.connectedToMobile;
        break;
      case ConnectivityResult.wifi:
        internetConnectionStatus =  AppConstants.connectedToWifi;
        break;
      case ConnectivityResult.none:
      default:
      internetConnectionStatus =  AppConstants.noInternetConnection;
    }

    final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers =
    { Factory(() => EagerGestureRecognizer())};
    print(widget.postUrl);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reddit Post'),
        actions: [
          IconButton(
            onPressed: () {
              exit(0);
            },
            padding: const EdgeInsets.all(10),
            icon: const Icon(Icons.close),
          ),

        ],
      ),
      body: Stack(
        children: <Widget>[
          internetConnectionStatus==AppConstants.noInternetConnection?
          const Center( child: Text(AppConstants.noInternetConnection),):
         Container(
           padding: const EdgeInsets.all(2),
         child:
             Card(
               elevation: 11,
         color: Colors.white70,
         child:
          WebView(
            key: _key,
            initialUrl: widget.postUrl,
            javascriptMode: JavascriptMode.unrestricted,
            gestureRecognizers: gestureRecognizers,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ))),
          isLoading ? const Center( child: CircularProgressIndicator(),)
              : Stack(),
        ],
      ));

  }
}