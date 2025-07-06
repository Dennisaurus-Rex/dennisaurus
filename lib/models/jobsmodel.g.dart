// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobsmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobsModel _$JobsModelFromJson(Map<String, dynamic> json) => _JobsModel(
      title: json['title'] as String,
      company: json['company'] as String,
      location: json['location'] as String,
      from: json['from'] as String,
      to: json['to'] as String?,
      tasks: (json['tasks'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$JobsModelToJson(_JobsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'company': instance.company,
      'location': instance.location,
      'from': instance.from,
      'to': instance.to,
      'tasks': instance.tasks,
    };
