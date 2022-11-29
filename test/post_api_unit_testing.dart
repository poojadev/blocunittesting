import 'package:bloc_test/bloc_test.dart';
import 'package:brawn/network/RestClient.dart';
import 'package:brawn/reddit/reddit_post/controller/bloc/RedditPostBloc.dart';
import 'package:brawn/reddit/reddit_post/controller/events/RedditPostFetchEvents.dart';
import 'package:brawn/reddit/reddit_post/controller/state/RedditPostFetchStates.dart';
import 'package:brawn/reddit/reddit_post/model/RedditPostsListPOJO.dart';
import 'package:brawn/util/AppConstants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'fixtures_reader.dart';

class MockRepository extends Mock implements RestClient {}

var dio = Dio()..options.baseUrl = AppConstants.baseUrl;
RestClient restApiClient = RestClient(dio);

void main() {
  late MockRepository mockRepository;
  RedditPostsListPOJO redditPostsListPOJO =
      RedditPostsListPOJO.fromJson('FlutterDev.json'.toFixture());
  late RedditPostBloc redditPostBloc;

  setUp(() {
    mockRepository = MockRepository();
    redditPostBloc = RedditPostBloc(restApiClient);
  });



  //test(
  //   "Test Http request",
  //   () async {
  //     HttpOverrides.global = null;
  //     RedditPostsListPOJO? catFact = await restApiClient.getRedditPosts();
  //     expect(catFact.data != null, true);
  //   },
  // );

  blocTest<RedditPostBloc, RedditPostFetchStates>(
      'redditPostBloc '
      'testing if API called at least once with response',
      build: () {
        when(() => mockRepository.getRedditPosts())
            .thenAnswer((invocation) async => redditPostsListPOJO);
        return RedditPostBloc(mockRepository);
      },
      act: (bloc) async {
        bloc.add(RedditPostDisplayed());
      },
      wait: const Duration(milliseconds: 1000),
      expect: () => {RedditPostFetchDisplay(redditPostsListPOJO)},
      verify: (_) async {
        verify((() => mockRepository.getRedditPosts())).called(1);
      });
}
