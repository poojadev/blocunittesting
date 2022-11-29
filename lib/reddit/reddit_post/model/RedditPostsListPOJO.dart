

import 'package:json_annotation/json_annotation.dart';
part 'RedditPostsListPOJO.g.dart';

@JsonSerializable()
class RedditPostsListPOJO
{
  late PostListData data;
  RedditPostsListPOJO(this.data);
  factory RedditPostsListPOJO.fromJson(Map<String, dynamic> json) => _$RedditPostsListPOJOFromJson(json);
  Map<String, dynamic> toJson() => _$RedditPostsListPOJOToJson(this);

}
@JsonSerializable()
class PostListData
{
    late String after;
    late int dist;
    late var geo_filter;
    late List<PostData>children;
    PostListData(this.after,this.dist,this.geo_filter,this.children);
    factory PostListData.fromJson(Map<String, dynamic> json) => _$PostListDataFromJson(json);
    Map<String, dynamic> toJson() => _$PostListDataToJson(this);



}
@JsonSerializable()
class PostData
{

    PostDataDetails data;
    PostData(this.data);
    factory PostData.fromJson(Map<String, dynamic> json) => _$PostDataFromJson(json);
    Map<String, dynamic> toJson() => _$PostDataToJson(this);


}
@JsonSerializable()
class PostDataDetails
{
    late var approved_at_utc;
    late String subreddit;
    late String selftext;
    late String author_fullname;
    late bool saved;
    late int score;
    late String subreddit_name_prefixed;
    late String title;
    late String permalink;
    late String url;
    late String  link_flair_text;
    late String  link_flair_background_color;

    PostDataDetails(this.approved_at_utc,this.subreddit,this.selftext,this.author_fullname,this.saved,
        this.score,this.subreddit_name_prefixed,this.title,this.permalink,this.url,this.link_flair_text
        ,this.link_flair_background_color);
    factory PostDataDetails.fromJson(Map<String, dynamic> json) => _$PostDataDetailsFromJson(json);
    Map<String, dynamic> toJson() => _$PostDataDetailsToJson(this);

}