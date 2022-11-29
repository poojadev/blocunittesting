import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../util/AppConstants.dart';
import '../reddit/reddit_post/model/RedditPostsListPOJO.dart';
part 'RestClient.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  //Function to fetch reddit post
  @GET(AppConstants.redditPostList)
  Future<RedditPostsListPOJO> getRedditPosts();



}



