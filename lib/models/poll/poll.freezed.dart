// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'poll.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Poll _$PollFromJson(Map<String, dynamic> json) {
  return _Poll.fromJson(json);
}

/// @nodoc
mixin _$Poll {
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  List<Choice> get choices => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get expirationDateTime => throw _privateConstructorUsedError;
  String get createdByUsername => throw _privateConstructorUsedError;
  String? get selectedChoice => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get totalVotes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PollCopyWith<Poll> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollCopyWith<$Res> {
  factory $PollCopyWith(Poll value, $Res Function(Poll) then) =
      _$PollCopyWithImpl<$Res, Poll>;
  @useResult
  $Res call(
      {String id,
      String question,
      List<Choice> choices,
      String status,
      DateTime expirationDateTime,
      String createdByUsername,
      String? selectedChoice,
      @JsonKey(defaultValue: 0) int totalVotes});
}

/// @nodoc
class _$PollCopyWithImpl<$Res, $Val extends Poll>
    implements $PollCopyWith<$Res> {
  _$PollCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? choices = null,
    Object? status = null,
    Object? expirationDateTime = null,
    Object? createdByUsername = null,
    Object? selectedChoice = freezed,
    Object? totalVotes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Choice>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDateTime: null == expirationDateTime
          ? _value.expirationDateTime
          : expirationDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdByUsername: null == createdByUsername
          ? _value.createdByUsername
          : createdByUsername // ignore: cast_nullable_to_non_nullable
              as String,
      selectedChoice: freezed == selectedChoice
          ? _value.selectedChoice
          : selectedChoice // ignore: cast_nullable_to_non_nullable
              as String?,
      totalVotes: null == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PollCopyWith<$Res> implements $PollCopyWith<$Res> {
  factory _$$_PollCopyWith(_$_Poll value, $Res Function(_$_Poll) then) =
      __$$_PollCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String question,
      List<Choice> choices,
      String status,
      DateTime expirationDateTime,
      String createdByUsername,
      String? selectedChoice,
      @JsonKey(defaultValue: 0) int totalVotes});
}

/// @nodoc
class __$$_PollCopyWithImpl<$Res> extends _$PollCopyWithImpl<$Res, _$_Poll>
    implements _$$_PollCopyWith<$Res> {
  __$$_PollCopyWithImpl(_$_Poll _value, $Res Function(_$_Poll) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? choices = null,
    Object? status = null,
    Object? expirationDateTime = null,
    Object? createdByUsername = null,
    Object? selectedChoice = freezed,
    Object? totalVotes = null,
  }) {
    return _then(_$_Poll(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Choice>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDateTime: null == expirationDateTime
          ? _value.expirationDateTime
          : expirationDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdByUsername: null == createdByUsername
          ? _value.createdByUsername
          : createdByUsername // ignore: cast_nullable_to_non_nullable
              as String,
      selectedChoice: freezed == selectedChoice
          ? _value.selectedChoice
          : selectedChoice // ignore: cast_nullable_to_non_nullable
              as String?,
      totalVotes: null == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Poll implements _Poll {
  const _$_Poll(
      {required this.id,
      required this.question,
      required final List<Choice> choices,
      required this.status,
      required this.expirationDateTime,
      required this.createdByUsername,
      this.selectedChoice,
      @JsonKey(defaultValue: 0) required this.totalVotes})
      : _choices = choices;

  factory _$_Poll.fromJson(Map<String, dynamic> json) => _$$_PollFromJson(json);

  @override
  final String id;
  @override
  final String question;
  final List<Choice> _choices;
  @override
  List<Choice> get choices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  final String status;
  @override
  final DateTime expirationDateTime;
  @override
  final String createdByUsername;
  @override
  final String? selectedChoice;
  @override
  @JsonKey(defaultValue: 0)
  final int totalVotes;

  @override
  String toString() {
    return 'Poll(id: $id, question: $question, choices: $choices, status: $status, expirationDateTime: $expirationDateTime, createdByUsername: $createdByUsername, selectedChoice: $selectedChoice, totalVotes: $totalVotes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Poll &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.expirationDateTime, expirationDateTime) ||
                other.expirationDateTime == expirationDateTime) &&
            (identical(other.createdByUsername, createdByUsername) ||
                other.createdByUsername == createdByUsername) &&
            (identical(other.selectedChoice, selectedChoice) ||
                other.selectedChoice == selectedChoice) &&
            (identical(other.totalVotes, totalVotes) ||
                other.totalVotes == totalVotes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question,
      const DeepCollectionEquality().hash(_choices),
      status,
      expirationDateTime,
      createdByUsername,
      selectedChoice,
      totalVotes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PollCopyWith<_$_Poll> get copyWith =>
      __$$_PollCopyWithImpl<_$_Poll>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PollToJson(
      this,
    );
  }
}

abstract class _Poll implements Poll {
  const factory _Poll(
      {required final String id,
      required final String question,
      required final List<Choice> choices,
      required final String status,
      required final DateTime expirationDateTime,
      required final String createdByUsername,
      final String? selectedChoice,
      @JsonKey(defaultValue: 0) required final int totalVotes}) = _$_Poll;

  factory _Poll.fromJson(Map<String, dynamic> json) = _$_Poll.fromJson;

  @override
  String get id;
  @override
  String get question;
  @override
  List<Choice> get choices;
  @override
  String get status;
  @override
  DateTime get expirationDateTime;
  @override
  String get createdByUsername;
  @override
  String? get selectedChoice;
  @override
  @JsonKey(defaultValue: 0)
  int get totalVotes;
  @override
  @JsonKey(ignore: true)
  _$$_PollCopyWith<_$_Poll> get copyWith => throw _privateConstructorUsedError;
}

Choice _$ChoiceFromJson(Map<String, dynamic> json) {
  return _Choice.fromJson(json);
}

/// @nodoc
mixin _$Choice {
  String get text => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get voteCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChoiceCopyWith<Choice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoiceCopyWith<$Res> {
  factory $ChoiceCopyWith(Choice value, $Res Function(Choice) then) =
      _$ChoiceCopyWithImpl<$Res, Choice>;
  @useResult
  $Res call({String text, @JsonKey(defaultValue: 0) int voteCount});
}

/// @nodoc
class _$ChoiceCopyWithImpl<$Res, $Val extends Choice>
    implements $ChoiceCopyWith<$Res> {
  _$ChoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? voteCount = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChoiceCopyWith<$Res> implements $ChoiceCopyWith<$Res> {
  factory _$$_ChoiceCopyWith(_$_Choice value, $Res Function(_$_Choice) then) =
      __$$_ChoiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, @JsonKey(defaultValue: 0) int voteCount});
}

/// @nodoc
class __$$_ChoiceCopyWithImpl<$Res>
    extends _$ChoiceCopyWithImpl<$Res, _$_Choice>
    implements _$$_ChoiceCopyWith<$Res> {
  __$$_ChoiceCopyWithImpl(_$_Choice _value, $Res Function(_$_Choice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? voteCount = null,
  }) {
    return _then(_$_Choice(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Choice implements _Choice {
  const _$_Choice(
      {required this.text, @JsonKey(defaultValue: 0) required this.voteCount});

  factory _$_Choice.fromJson(Map<String, dynamic> json) =>
      _$$_ChoiceFromJson(json);

  @override
  final String text;
  @override
  @JsonKey(defaultValue: 0)
  final int voteCount;

  @override
  String toString() {
    return 'Choice(text: $text, voteCount: $voteCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Choice &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, voteCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChoiceCopyWith<_$_Choice> get copyWith =>
      __$$_ChoiceCopyWithImpl<_$_Choice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChoiceToJson(
      this,
    );
  }
}

abstract class _Choice implements Choice {
  const factory _Choice(
      {required final String text,
      @JsonKey(defaultValue: 0) required final int voteCount}) = _$_Choice;

  factory _Choice.fromJson(Map<String, dynamic> json) = _$_Choice.fromJson;

  @override
  String get text;
  @override
  @JsonKey(defaultValue: 0)
  int get voteCount;
  @override
  @JsonKey(ignore: true)
  _$$_ChoiceCopyWith<_$_Choice> get copyWith =>
      throw _privateConstructorUsedError;
}
