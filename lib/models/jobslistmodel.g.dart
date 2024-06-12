// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobslistmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobsListModel _$$_JobsListModelFromJson(Map<String, dynamic> json) =>
    _$_JobsListModel(
      jobs: (json['jobs'] as List<dynamic>)
          .map((e) => JobsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_JobsListModelToJson(_$_JobsListModel instance) =>
    <String, dynamic>{
      'jobs': instance.jobs,
    };
