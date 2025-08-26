// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostsState {

/// getAllPosts
 VarStatus get allPostsStatus; List<PostModel> get posts;/// getPostById
 VarStatus get selectedPostStatus; PostModel? get selectedPost;/// getPostsByUserId
 VarStatus get userPostsStatus; List<PostModel> get userPosts;
/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostsStateCopyWith<PostsState> get copyWith => _$PostsStateCopyWithImpl<PostsState>(this as PostsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostsState&&(identical(other.allPostsStatus, allPostsStatus) || other.allPostsStatus == allPostsStatus)&&const DeepCollectionEquality().equals(other.posts, posts)&&(identical(other.selectedPostStatus, selectedPostStatus) || other.selectedPostStatus == selectedPostStatus)&&(identical(other.selectedPost, selectedPost) || other.selectedPost == selectedPost)&&(identical(other.userPostsStatus, userPostsStatus) || other.userPostsStatus == userPostsStatus)&&const DeepCollectionEquality().equals(other.userPosts, userPosts));
}


@override
int get hashCode => Object.hash(runtimeType,allPostsStatus,const DeepCollectionEquality().hash(posts),selectedPostStatus,selectedPost,userPostsStatus,const DeepCollectionEquality().hash(userPosts));

@override
String toString() {
  return 'PostsState(allPostsStatus: $allPostsStatus, posts: $posts, selectedPostStatus: $selectedPostStatus, selectedPost: $selectedPost, userPostsStatus: $userPostsStatus, userPosts: $userPosts)';
}


}

/// @nodoc
abstract mixin class $PostsStateCopyWith<$Res>  {
  factory $PostsStateCopyWith(PostsState value, $Res Function(PostsState) _then) = _$PostsStateCopyWithImpl;
@useResult
$Res call({
 VarStatus allPostsStatus, List<PostModel> posts, VarStatus selectedPostStatus, PostModel? selectedPost, VarStatus userPostsStatus, List<PostModel> userPosts
});


$PostModelCopyWith<$Res>? get selectedPost;

}
/// @nodoc
class _$PostsStateCopyWithImpl<$Res>
    implements $PostsStateCopyWith<$Res> {
  _$PostsStateCopyWithImpl(this._self, this._then);

  final PostsState _self;
  final $Res Function(PostsState) _then;

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allPostsStatus = null,Object? posts = null,Object? selectedPostStatus = null,Object? selectedPost = freezed,Object? userPostsStatus = null,Object? userPosts = null,}) {
  return _then(_self.copyWith(
allPostsStatus: null == allPostsStatus ? _self.allPostsStatus : allPostsStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostModel>,selectedPostStatus: null == selectedPostStatus ? _self.selectedPostStatus : selectedPostStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,selectedPost: freezed == selectedPost ? _self.selectedPost : selectedPost // ignore: cast_nullable_to_non_nullable
as PostModel?,userPostsStatus: null == userPostsStatus ? _self.userPostsStatus : userPostsStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,userPosts: null == userPosts ? _self.userPosts : userPosts // ignore: cast_nullable_to_non_nullable
as List<PostModel>,
  ));
}
/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostModelCopyWith<$Res>? get selectedPost {
    if (_self.selectedPost == null) {
    return null;
  }

  return $PostModelCopyWith<$Res>(_self.selectedPost!, (value) {
    return _then(_self.copyWith(selectedPost: value));
  });
}
}


/// Adds pattern-matching-related methods to [PostsState].
extension PostsStatePatterns on PostsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( VarStatus allPostsStatus,  List<PostModel> posts,  VarStatus selectedPostStatus,  PostModel? selectedPost,  VarStatus userPostsStatus,  List<PostModel> userPosts)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.allPostsStatus,_that.posts,_that.selectedPostStatus,_that.selectedPost,_that.userPostsStatus,_that.userPosts);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( VarStatus allPostsStatus,  List<PostModel> posts,  VarStatus selectedPostStatus,  PostModel? selectedPost,  VarStatus userPostsStatus,  List<PostModel> userPosts)  initial,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.allPostsStatus,_that.posts,_that.selectedPostStatus,_that.selectedPost,_that.userPostsStatus,_that.userPosts);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( VarStatus allPostsStatus,  List<PostModel> posts,  VarStatus selectedPostStatus,  PostModel? selectedPost,  VarStatus userPostsStatus,  List<PostModel> userPosts)?  initial,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.allPostsStatus,_that.posts,_that.selectedPostStatus,_that.selectedPost,_that.userPostsStatus,_that.userPosts);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PostsState {
  const _Initial({this.allPostsStatus = const VarStatus(), final  List<PostModel> posts = const [], this.selectedPostStatus = const VarStatus(), this.selectedPost, this.userPostsStatus = const VarStatus(), final  List<PostModel> userPosts = const []}): _posts = posts,_userPosts = userPosts;
  

/// getAllPosts
@override@JsonKey() final  VarStatus allPostsStatus;
 final  List<PostModel> _posts;
@override@JsonKey() List<PostModel> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

/// getPostById
@override@JsonKey() final  VarStatus selectedPostStatus;
@override final  PostModel? selectedPost;
/// getPostsByUserId
@override@JsonKey() final  VarStatus userPostsStatus;
 final  List<PostModel> _userPosts;
@override@JsonKey() List<PostModel> get userPosts {
  if (_userPosts is EqualUnmodifiableListView) return _userPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userPosts);
}


/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.allPostsStatus, allPostsStatus) || other.allPostsStatus == allPostsStatus)&&const DeepCollectionEquality().equals(other._posts, _posts)&&(identical(other.selectedPostStatus, selectedPostStatus) || other.selectedPostStatus == selectedPostStatus)&&(identical(other.selectedPost, selectedPost) || other.selectedPost == selectedPost)&&(identical(other.userPostsStatus, userPostsStatus) || other.userPostsStatus == userPostsStatus)&&const DeepCollectionEquality().equals(other._userPosts, _userPosts));
}


@override
int get hashCode => Object.hash(runtimeType,allPostsStatus,const DeepCollectionEquality().hash(_posts),selectedPostStatus,selectedPost,userPostsStatus,const DeepCollectionEquality().hash(_userPosts));

@override
String toString() {
  return 'PostsState.initial(allPostsStatus: $allPostsStatus, posts: $posts, selectedPostStatus: $selectedPostStatus, selectedPost: $selectedPost, userPostsStatus: $userPostsStatus, userPosts: $userPosts)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $PostsStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 VarStatus allPostsStatus, List<PostModel> posts, VarStatus selectedPostStatus, PostModel? selectedPost, VarStatus userPostsStatus, List<PostModel> userPosts
});


@override $PostModelCopyWith<$Res>? get selectedPost;

}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allPostsStatus = null,Object? posts = null,Object? selectedPostStatus = null,Object? selectedPost = freezed,Object? userPostsStatus = null,Object? userPosts = null,}) {
  return _then(_Initial(
allPostsStatus: null == allPostsStatus ? _self.allPostsStatus : allPostsStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostModel>,selectedPostStatus: null == selectedPostStatus ? _self.selectedPostStatus : selectedPostStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,selectedPost: freezed == selectedPost ? _self.selectedPost : selectedPost // ignore: cast_nullable_to_non_nullable
as PostModel?,userPostsStatus: null == userPostsStatus ? _self.userPostsStatus : userPostsStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,userPosts: null == userPosts ? _self._userPosts : userPosts // ignore: cast_nullable_to_non_nullable
as List<PostModel>,
  ));
}

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostModelCopyWith<$Res>? get selectedPost {
    if (_self.selectedPost == null) {
    return null;
  }

  return $PostModelCopyWith<$Res>(_self.selectedPost!, (value) {
    return _then(_self.copyWith(selectedPost: value));
  });
}
}

// dart format on
