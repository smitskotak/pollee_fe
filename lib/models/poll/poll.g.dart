// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Poll _$$_PollFromJson(Map<String, dynamic> json) => _$_Poll(
      id: json['id'] as String,
      question: json['question'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'] as String,
      expiresOn: DateTime.parse(json['expiresOn'] as String),
      selectedChoice: json['selectedChoice'] as String?,
      votesCount: json['votesCount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_PollToJson(_$_Poll instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'options': instance.options,
      'status': instance.status,
      'expiresOn': instance.expiresOn.toIso8601String(),
      'selectedChoice': instance.selectedChoice,
      'votesCount': instance.votesCount,
    };
