import 'dart:io';
import 'package:brawn/reddit/reddit_post/controller/bloc/RedditPostBloc.dart';
import 'package:brawn/reddit/reddit_post/controller/state/RedditPostFetchStates.dart';
import 'package:brawn/reddit/reddit_post/view/RedditPostListWidget.dart';
import 'package:brawn/util/AppConstants.dart';
import 'package:brawn/util/InternetStatus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
const String routeName = "/HomePage";
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePage> {
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


  @override
  void dispose() {
    connectivity.disposeStream();
    super.dispose();
  }
  final ScrollController _controller = ScrollController();
  void _scrollUp() {
    _controller.animateTo(
      _controller.position.minScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  late String internetConnectionStatus;

  @override
  Widget build(BuildContext context) {
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.mobile:
        internetConnectionStatus = AppConstants.connectedToMobile;
        break;
      case ConnectivityResult.wifi:
        internetConnectionStatus = AppConstants.connectedToWifi;
        break;
      case ConnectivityResult.none:
      default:
        internetConnectionStatus = AppConstants.noInternetConnection;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appTitle),
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
      backgroundColor: Colors.white,
      body: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(children: [
            internetConnectionStatus == AppConstants.noInternetConnection
                ? Container(
                    alignment: Alignment.center,
                    child: const Text(AppConstants.noInternetConnection),
                  )
                : BlocBuilder<RedditPostBloc, RedditPostFetchStates>(
                    builder: (context, state) {
                    if (state is RedditPostFetchDisplay) {
                      return Stack(children: [
                        Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(5),
                            height: MediaQuery.of(context).size.height * 0.9,
                            width: MediaQuery.of(context).size.width,
                            child: redditPostListWidget(
                                _controller, state.redditPostListPOJO)),
                        _controller.positions.isNotEmpty
                            ? Container(
                                alignment: Alignment.bottomRight,
                                padding: const EdgeInsets.all(10),
                                child: FloatingActionButton.small(
                                  onPressed: _scrollUp,
                                  child: const Icon(Icons.arrow_circle_up),
                                ),
                              )
                            : Container(),
                      ]);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  })
          ])),
    );
  }
}
