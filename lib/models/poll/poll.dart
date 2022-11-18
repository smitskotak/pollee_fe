import 'package:freezed_annotation/freezed_annotation.dart';

part 'poll.freezed.dart';
part 'poll.g.dart';

@freezed
class Poll with _$Poll {
  const factory Poll({
    required String id,
    required String question,
    required List<Choice> choices,
    @JsonKey(defaultValue: 'APPROVED') required String status,
    required DateTime expirationDateTime,
    required String createdByUsername,
    String? selectedChoice,
    @JsonKey(defaultValue: 0) required int totalVotes,
  }) = _Poll;

  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);
}

@freezed
class Choice with _$Choice {
  const factory Choice({
    required String text,
    @JsonKey(defaultValue: 0) required int voteCount,
  }) = _Choice;

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
}
