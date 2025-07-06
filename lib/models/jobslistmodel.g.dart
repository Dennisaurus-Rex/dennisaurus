// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobslistmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobsListModel _$JobsListModelFromJson(Map<String, dynamic> json) =>
    _JobsListModel(
      jobs: (json['jobs'] as List<dynamic>)
          .map((e) => JobsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JobsListModelToJson(_JobsListModel instance) =>
    <String, dynamic>{
      'jobs': instance.jobs,
    };
