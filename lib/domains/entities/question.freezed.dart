// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Question {
  String get questionId;
  String get text;
  String? get answer;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<Question> get copyWith =>
      _$QuestionCopyWithImpl<Question>(this as Question, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Question &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, questionId, text, answer);

  @override
  String toString() {
    return 'Question(questionId: $questionId, text: $text, answer: $answer)';
  }
}

/// @nodoc
abstract mixin class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) _then) =
      _$QuestionCopyWithImpl;
  @useResult
  $Res call({String questionId, String text, String? answer});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res> implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._self, this._then);

  final Question _self;
  final $Res Function(Question) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? text = null,
    Object? answer = freezed,
  }) {
    return _then(_self.copyWith(
      questionId: null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      answer: freezed == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _Question implements Question {
  const _Question({required this.questionId, required this.text, this.answer});

  @override
  final String questionId;
  @override
  final String text;
  @override
  final String? answer;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuestionCopyWith<_Question> get copyWith =>
      __$QuestionCopyWithImpl<_Question>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Question &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, questionId, text, answer);

  @override
  String toString() {
    return 'Question(questionId: $questionId, text: $text, answer: $answer)';
  }
}

/// @nodoc
abstract mixin class _$QuestionCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) _then) =
      __$QuestionCopyWithImpl;
  @override
  @useResult
  $Res call({String questionId, String text, String? answer});
}

/// @nodoc
class __$QuestionCopyWithImpl<$Res> implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(this._self, this._then);

  final _Question _self;
  final $Res Function(_Question) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? questionId = null,
    Object? text = null,
    Object? answer = freezed,
  }) {
    return _then(_Question(
      questionId: null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      answer: freezed == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$AnsweredQuestion {
// 質問情報
  Question get question; // プロフィール情報
  Profile get profile;

  /// Create a copy of AnsweredQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AnsweredQuestionCopyWith<AnsweredQuestion> get copyWith =>
      _$AnsweredQuestionCopyWithImpl<AnsweredQuestion>(
          this as AnsweredQuestion, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AnsweredQuestion &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, question, profile);

  @override
  String toString() {
    return 'AnsweredQuestion(question: $question, profile: $profile)';
  }
}

/// @nodoc
abstract mixin class $AnsweredQuestionCopyWith<$Res> {
  factory $AnsweredQuestionCopyWith(
          AnsweredQuestion value, $Res Function(AnsweredQuestion) _then) =
      _$AnsweredQuestionCopyWithImpl;
  @useResult
  $Res call({Question question, Profile profile});

  $QuestionCopyWith<$Res> get question;
  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$AnsweredQuestionCopyWithImpl<$Res>
    implements $AnsweredQuestionCopyWith<$Res> {
  _$AnsweredQuestionCopyWithImpl(this._self, this._then);

  final AnsweredQuestion _self;
  final $Res Function(AnsweredQuestion) _then;

  /// Create a copy of AnsweredQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? profile = null,
  }) {
    return _then(_self.copyWith(
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
      profile: null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }

  /// Create a copy of AnsweredQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<$Res> get question {
    return $QuestionCopyWith<$Res>(_self.question, (value) {
      return _then(_self.copyWith(question: value));
    });
  }

  /// Create a copy of AnsweredQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_self.profile, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _AnsweredQuestion extends AnsweredQuestion {
  const _AnsweredQuestion({required this.question, required this.profile})
      : super._();

// 質問情報
  @override
  final Question question;
// プロフィール情報
  @override
  final Profile profile;

  /// Create a copy of AnsweredQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AnsweredQuestionCopyWith<_AnsweredQuestion> get copyWith =>
      __$AnsweredQuestionCopyWithImpl<_AnsweredQuestion>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnsweredQuestion &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, question, profile);

  @override
  String toString() {
    return 'AnsweredQuestion(question: $question, profile: $profile)';
  }
}

/// @nodoc
abstract mixin class _$AnsweredQuestionCopyWith<$Res>
    implements $AnsweredQuestionCopyWith<$Res> {
  factory _$AnsweredQuestionCopyWith(
          _AnsweredQuestion value, $Res Function(_AnsweredQuestion) _then) =
      __$AnsweredQuestionCopyWithImpl;
  @override
  @useResult
  $Res call({Question question, Profile profile});

  @override
  $QuestionCopyWith<$Res> get question;
  @override
  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$AnsweredQuestionCopyWithImpl<$Res>
    implements _$AnsweredQuestionCopyWith<$Res> {
  __$AnsweredQuestionCopyWithImpl(this._self, this._then);

  final _AnsweredQuestion _self;
  final $Res Function(_AnsweredQuestion) _then;

  /// Create a copy of AnsweredQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? question = null,
    Object? profile = null,
  }) {
    return _then(_AnsweredQuestion(
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
      profile: null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }

  /// Create a copy of AnsweredQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<$Res> get question {
    return $QuestionCopyWith<$Res>(_self.question, (value) {
      return _then(_self.copyWith(question: value));
    });
  }

  /// Create a copy of AnsweredQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_self.profile, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

/// @nodoc
mixin _$ReceivedQuestion {
  Question get question;

  /// Create a copy of ReceivedQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReceivedQuestionCopyWith<ReceivedQuestion> get copyWith =>
      _$ReceivedQuestionCopyWithImpl<ReceivedQuestion>(
          this as ReceivedQuestion, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReceivedQuestion &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @override
  int get hashCode => Object.hash(runtimeType, question);

  @override
  String toString() {
    return 'ReceivedQuestion(question: $question)';
  }
}

/// @nodoc
abstract mixin class $ReceivedQuestionCopyWith<$Res> {
  factory $ReceivedQuestionCopyWith(
          ReceivedQuestion value, $Res Function(ReceivedQuestion) _then) =
      _$ReceivedQuestionCopyWithImpl;
  @useResult
  $Res call({Question question});

  $QuestionCopyWith<$Res> get question;
}

/// @nodoc
class _$ReceivedQuestionCopyWithImpl<$Res>
    implements $ReceivedQuestionCopyWith<$Res> {
  _$ReceivedQuestionCopyWithImpl(this._self, this._then);

  final ReceivedQuestion _self;
  final $Res Function(ReceivedQuestion) _then;

  /// Create a copy of ReceivedQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
  }) {
    return _then(_self.copyWith(
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
    ));
  }

  /// Create a copy of ReceivedQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<$Res> get question {
    return $QuestionCopyWith<$Res>(_self.question, (value) {
      return _then(_self.copyWith(question: value));
    });
  }
}

/// @nodoc

class _ReceivedQuestion extends ReceivedQuestion {
  const _ReceivedQuestion({required this.question}) : super._();

  @override
  final Question question;

  /// Create a copy of ReceivedQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReceivedQuestionCopyWith<_ReceivedQuestion> get copyWith =>
      __$ReceivedQuestionCopyWithImpl<_ReceivedQuestion>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReceivedQuestion &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @override
  int get hashCode => Object.hash(runtimeType, question);

  @override
  String toString() {
    return 'ReceivedQuestion(question: $question)';
  }
}

/// @nodoc
abstract mixin class _$ReceivedQuestionCopyWith<$Res>
    implements $ReceivedQuestionCopyWith<$Res> {
  factory _$ReceivedQuestionCopyWith(
          _ReceivedQuestion value, $Res Function(_ReceivedQuestion) _then) =
      __$ReceivedQuestionCopyWithImpl;
  @override
  @useResult
  $Res call({Question question});

  @override
  $QuestionCopyWith<$Res> get question;
}

/// @nodoc
class __$ReceivedQuestionCopyWithImpl<$Res>
    implements _$ReceivedQuestionCopyWith<$Res> {
  __$ReceivedQuestionCopyWithImpl(this._self, this._then);

  final _ReceivedQuestion _self;
  final $Res Function(_ReceivedQuestion) _then;

  /// Create a copy of ReceivedQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? question = null,
  }) {
    return _then(_ReceivedQuestion(
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
    ));
  }

  /// Create a copy of ReceivedQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<$Res> get question {
    return $QuestionCopyWith<$Res>(_self.question, (value) {
      return _then(_self.copyWith(question: value));
    });
  }
}

/// @nodoc
mixin _$QuestionUser {
  /// ユーザーID
  String get id;

  /// ユーザー名
  String get name;

  /// 性別
  GenderCode get genderCode;

  /// 年齢
  int? get age;

  /// 市区町村
  String get city;

  /// プロフィール画像URLのリスト
  List<String> get images;

  /// ベスト画像のSignedImageUrlsエンティティ（サイズ指定でURLを取得可能）
  SignedImageUrls? get bestImageUrls;

  /// 最終ログインからの経過時間
  LoginStatus get loginStatus;

  /// 本人確認レベル
  CertificateLevel get certificateLevel;

  /// お気に入り状態
  bool get isFavorite;

  /// いいね状態
  bool get isLiked;

  /// Create a copy of QuestionUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestionUserCopyWith<QuestionUser> get copyWith =>
      _$QuestionUserCopyWithImpl<QuestionUser>(
          this as QuestionUser, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuestionUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.genderCode, genderCode) ||
                other.genderCode == genderCode) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.bestImageUrls, bestImageUrls) ||
                other.bestImageUrls == bestImageUrls) &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus) &&
            (identical(other.certificateLevel, certificateLevel) ||
                other.certificateLevel == certificateLevel) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      genderCode,
      age,
      city,
      const DeepCollectionEquality().hash(images),
      bestImageUrls,
      loginStatus,
      certificateLevel,
      isFavorite,
      isLiked);

  @override
  String toString() {
    return 'QuestionUser(id: $id, name: $name, genderCode: $genderCode, age: $age, city: $city, images: $images, bestImageUrls: $bestImageUrls, loginStatus: $loginStatus, certificateLevel: $certificateLevel, isFavorite: $isFavorite, isLiked: $isLiked)';
  }
}

/// @nodoc
abstract mixin class $QuestionUserCopyWith<$Res> {
  factory $QuestionUserCopyWith(
          QuestionUser value, $Res Function(QuestionUser) _then) =
      _$QuestionUserCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      GenderCode genderCode,
      int? age,
      String city,
      List<String> images,
      SignedImageUrls? bestImageUrls,
      LoginStatus loginStatus,
      CertificateLevel certificateLevel,
      bool isFavorite,
      bool isLiked});

  $SignedImageUrlsCopyWith<$Res>? get bestImageUrls;
}

/// @nodoc
class _$QuestionUserCopyWithImpl<$Res> implements $QuestionUserCopyWith<$Res> {
  _$QuestionUserCopyWithImpl(this._self, this._then);

  final QuestionUser _self;
  final $Res Function(QuestionUser) _then;

  /// Create a copy of QuestionUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? genderCode = null,
    Object? age = freezed,
    Object? city = null,
    Object? images = null,
    Object? bestImageUrls = freezed,
    Object? loginStatus = null,
    Object? certificateLevel = null,
    Object? isFavorite = null,
    Object? isLiked = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      genderCode: null == genderCode
          ? _self.genderCode
          : genderCode // ignore: cast_nullable_to_non_nullable
              as GenderCode,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bestImageUrls: freezed == bestImageUrls
          ? _self.bestImageUrls
          : bestImageUrls // ignore: cast_nullable_to_non_nullable
              as SignedImageUrls?,
      loginStatus: null == loginStatus
          ? _self.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as LoginStatus,
      certificateLevel: null == certificateLevel
          ? _self.certificateLevel
          : certificateLevel // ignore: cast_nullable_to_non_nullable
              as CertificateLevel,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isLiked: null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of QuestionUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignedImageUrlsCopyWith<$Res>? get bestImageUrls {
    if (_self.bestImageUrls == null) {
      return null;
    }

    return $SignedImageUrlsCopyWith<$Res>(_self.bestImageUrls!, (value) {
      return _then(_self.copyWith(bestImageUrls: value));
    });
  }
}

/// @nodoc

class _QuestionUser extends QuestionUser {
  const _QuestionUser(
      {required this.id,
      required this.name,
      required this.genderCode,
      required this.age,
      required this.city,
      required final List<String> images,
      required this.bestImageUrls,
      required this.loginStatus,
      this.certificateLevel = CertificateLevel.unspecified,
      this.isFavorite = false,
      this.isLiked = false})
      : _images = images,
        super._();

  /// ユーザーID
  @override
  final String id;

  /// ユーザー名
  @override
  final String name;

  /// 性別
  @override
  final GenderCode genderCode;

  /// 年齢
  @override
  final int? age;

  /// 市区町村
  @override
  final String city;

  /// プロフィール画像URLのリスト
  final List<String> _images;

  /// プロフィール画像URLのリスト
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  /// ベスト画像のSignedImageUrlsエンティティ（サイズ指定でURLを取得可能）
  @override
  final SignedImageUrls? bestImageUrls;

  /// 最終ログインからの経過時間
  @override
  final LoginStatus loginStatus;

  /// 本人確認レベル
  @override
  @JsonKey()
  final CertificateLevel certificateLevel;

  /// お気に入り状態
  @override
  @JsonKey()
  final bool isFavorite;

  /// いいね状態
  @override
  @JsonKey()
  final bool isLiked;

  /// Create a copy of QuestionUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuestionUserCopyWith<_QuestionUser> get copyWith =>
      __$QuestionUserCopyWithImpl<_QuestionUser>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestionUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.genderCode, genderCode) ||
                other.genderCode == genderCode) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.bestImageUrls, bestImageUrls) ||
                other.bestImageUrls == bestImageUrls) &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus) &&
            (identical(other.certificateLevel, certificateLevel) ||
                other.certificateLevel == certificateLevel) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      genderCode,
      age,
      city,
      const DeepCollectionEquality().hash(_images),
      bestImageUrls,
      loginStatus,
      certificateLevel,
      isFavorite,
      isLiked);

  @override
  String toString() {
    return 'QuestionUser(id: $id, name: $name, genderCode: $genderCode, age: $age, city: $city, images: $images, bestImageUrls: $bestImageUrls, loginStatus: $loginStatus, certificateLevel: $certificateLevel, isFavorite: $isFavorite, isLiked: $isLiked)';
  }
}

/// @nodoc
abstract mixin class _$QuestionUserCopyWith<$Res>
    implements $QuestionUserCopyWith<$Res> {
  factory _$QuestionUserCopyWith(
          _QuestionUser value, $Res Function(_QuestionUser) _then) =
      __$QuestionUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      GenderCode genderCode,
      int? age,
      String city,
      List<String> images,
      SignedImageUrls? bestImageUrls,
      LoginStatus loginStatus,
      CertificateLevel certificateLevel,
      bool isFavorite,
      bool isLiked});

  @override
  $SignedImageUrlsCopyWith<$Res>? get bestImageUrls;
}

/// @nodoc
class __$QuestionUserCopyWithImpl<$Res>
    implements _$QuestionUserCopyWith<$Res> {
  __$QuestionUserCopyWithImpl(this._self, this._then);

  final _QuestionUser _self;
  final $Res Function(_QuestionUser) _then;

  /// Create a copy of QuestionUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? genderCode = null,
    Object? age = freezed,
    Object? city = null,
    Object? images = null,
    Object? bestImageUrls = freezed,
    Object? loginStatus = null,
    Object? certificateLevel = null,
    Object? isFavorite = null,
    Object? isLiked = null,
  }) {
    return _then(_QuestionUser(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      genderCode: null == genderCode
          ? _self.genderCode
          : genderCode // ignore: cast_nullable_to_non_nullable
              as GenderCode,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bestImageUrls: freezed == bestImageUrls
          ? _self.bestImageUrls
          : bestImageUrls // ignore: cast_nullable_to_non_nullable
              as SignedImageUrls?,
      loginStatus: null == loginStatus
          ? _self.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as LoginStatus,
      certificateLevel: null == certificateLevel
          ? _self.certificateLevel
          : certificateLevel // ignore: cast_nullable_to_non_nullable
              as CertificateLevel,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isLiked: null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of QuestionUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignedImageUrlsCopyWith<$Res>? get bestImageUrls {
    if (_self.bestImageUrls == null) {
      return null;
    }

    return $SignedImageUrlsCopyWith<$Res>(_self.bestImageUrls!, (value) {
      return _then(_self.copyWith(bestImageUrls: value));
    });
  }
}

// dart format on
