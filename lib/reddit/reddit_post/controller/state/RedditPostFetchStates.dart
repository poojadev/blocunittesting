import 'package:equatable/equatable.dart';

import '../../model/RedditPostsListPOJO.dart';


abstract class RedditPostFetchStates extends Equatable {
  const RedditPostFetchStates();

  @override
  List<Object?> get props => [];
}
class RedditPostFetchInit extends RedditPostFetchStates {

}



class RedditPostFetchDisplay extends RedditPostFetchStates {
  final RedditPostsListPOJO redditPostListPOJO;
  const RedditPostFetchDisplay(this.redditPostListPOJO);
   @override
   // TODO: implement props
   List<Object?> get props => [redditPostListPOJO];
}

