import 'package:bloc/bloc.dart';
import '../../../../network/RestClient.dart';
import '../../../../util/AppConstants.dart';
import '../../model/RedditPostsListPOJO.dart';
import '../events/RedditPostFetchEvents.dart';
import '../state/RedditPostFetchStates.dart';
import 'package:dio/dio.dart';
var dio = Dio()..options.baseUrl = AppConstants.baseUrl;

class RedditPostBloc
    extends Bloc<RedditPostFetchEvents, RedditPostFetchStates> {
  RestClient restApiClient = RestClient(dio);
  RedditPostBloc(this.restApiClient)
      : super( RedditPostFetchInit()) {

    /*RedditPostDisplayed Event will execute when reddit post data will be fetched from URL
    and RedditPostFetchDisplay status will emit/add the response to the state from URL */
    on<RedditPostDisplayed>((event, emit) async {
        RedditPostsListPOJO? redditPostListPOJO =
        await restApiClient.getRedditPosts();
        emit(RedditPostFetchDisplay(redditPostListPOJO));

    });



  }
}
