// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Poll _$$_PollFromJson(Map<String, dynamic> json) => _$_Poll(
      id: json['id'] as String,
      question: json['question'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      expirationDateTime: DateTime.parse(json['expirationDateTime'] as String),
      selectedChoice: json['selectedChoice'] as String?,
      totalVotes: json['totalVotes'] as int? ?? 0,
    );

Map<String, dynamic> _$$_PollToJson(_$_Poll instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'choices': instance.choices,
      'status': instance.status,
      'expirationDateTime': instance.expirationDateTime.toIso8601String(),
      'selectedChoice': instance.selectedChoice,
      'totalVotes': instance.totalVotes,
    };

_$_Choice _$$_ChoiceFromJson(Map<String, dynamic> json) => _$_Choice(
      text: json['text'] as String,
      voteCount: json['voteCount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ChoiceToJson(_$_Choice instance) => <String, dynamic>{
      'text': instance.text,
      'voteCount': instance.voteCount,
    };
