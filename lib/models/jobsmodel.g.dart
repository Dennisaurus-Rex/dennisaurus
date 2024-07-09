// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobsmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobsModelImpl _$$JobsModelImplFromJson(Map<String, dynamic> json) =>
    _$JobsModelImpl(
      title: json['title'] as String,
      company: json['company'] as String,
      location: json['location'] as String,
      from: json['from'] as String,
      to: json['to'] as String?,
      tasks: (json['tasks'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$JobsModelImplToJson(_$JobsModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'company': instance.company,
      'location': instance.location,
      'from': instance.from,
      'to': instance.to,
      'tasks': instance.tasks,
    };
