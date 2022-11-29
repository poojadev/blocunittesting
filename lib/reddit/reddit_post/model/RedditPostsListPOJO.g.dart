// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RedditPostsListPOJO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditPostsListPOJO _$RedditPostsListPOJOFromJson(Map<String, dynamic> json) =>
    RedditPostsListPOJO(
      PostListData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RedditPostsListPOJOToJson(
        RedditPostsListPOJO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

PostListData _$PostListDataFromJson(Map<String, dynamic> json) => PostListData(
      json['after'] as String,
      json['dist'] as int,
      json['geo_filter'],
      (json['children'] as List<dynamic>)
          .map((e) => PostData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostListDataToJson(PostListData instance) =>
    <String, dynamic>{
      'after': instance.after,
      'dist': instance.dist,
      'geo_filter': instance.geo_filter,
      'children': instance.children,
    };

PostData _$PostDataFromJson(Map<String, dynamic> json) => PostData(
      PostDataDetails.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
      'data': instance.data,
    };

PostDataDetails _$PostDataDetailsFromJson(Map<String, dynamic> json) =>
    PostDataDetails(
      json['approved_at_utc'],
      json['subreddit'] as String,
      json['selftext'] as String,
      json['author_fullname'] as String,
      json['saved'] as bool,
      json['score'] as int,
      json['subreddit_name_prefixed'] as String,
      json['title'] as String,
      json['permalink'] as String,
      json['url'] as String,
      json['link_flair_text'] as String,
      json['link_flair_background_color'] as String,
    );

Map<String, dynamic> _$PostDataDetailsToJson(PostDataDetails instance) =>
    <String, dynamic>{
      'approved_at_utc': instance.approved_at_utc,
      'subreddit': instance.subreddit,
      'selftext': instance.selftext,
      'author_fullname': instance.author_fullname,
      'saved': instance.saved,
      'score': instance.score,
      'subreddit_name_prefixed': instance.subreddit_name_prefixed,
      'title': instance.title,
      'permalink': instance.permalink,
      'url': instance.url,
      'link_flair_text': instance.link_flair_text,
      'link_flair_background_color': instance.link_flair_background_color,
    };
