import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:case_devindo/model/post.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostUninitialized());

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    List<Post> posts;
    if (state is PostUninitialized) {
      posts = await Post.connectToAPI(0, 10);
      yield PostLoaded(posts: posts, hasReachMax: false);
    } else {
      PostLoaded postLoaded = state as PostLoaded;
      posts = await Post.connectToAPI(postLoaded.posts.length, 10);

      yield (posts.isEmpty)
          ? postLoaded.copyWith(hasReachMax: true)
          : PostLoaded(posts: postLoaded.posts + posts, hasReachMax: false);
    }
  }
}
