
import 'package:brawn/homepage.dart';
import 'package:brawn/reddit/reddit_post/controller/bloc/RedditPostBloc.dart';
import 'package:brawn/reddit/reddit_post/controller/events/RedditPostFetchEvents.dart';
import 'package:brawn/util/AppBlocObserver.dart';
import 'package:brawn/util/AppConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:dio/dio.dart';

import 'network/RestClient.dart';
var dio = Dio()..options.baseUrl = AppConstants.baseUrl;

void main()  async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(  const MaterialApp(
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<RedditPostBloc>(
            create: (BuildContext context) =>
            RedditPostBloc(RestClient(dio))..add(RedditPostDisplayed()),
          ),

        ],
        child:
        // runApp(
        MaterialApp(
          theme: ThemeData(
            //text styling
            textTheme: const TextTheme(
              bodyText1: TextStyle(fontSize: 14.0,  fontStyle: FontStyle.normal,color: Colors.white),
              headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Colors.black87),
              bodyText2: TextStyle(fontSize: 14.0,  fontStyle: FontStyle.normal,color: Colors.black),
            ),
          ),

          initialRoute: '/HomePage' ,
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {

              case '/HomePage':

                return
                  PageTransition(
                    child:const HomePage(),
                    type: PageTransitionType.leftToRight,
                    settings: settings,
                  );
                break;
              default:
                return
                  PageTransition(
                    child:const HomePage(),
                    type: PageTransitionType.leftToRight,
                    settings: settings,
                  );

            }
          },
        ));

  }
}


