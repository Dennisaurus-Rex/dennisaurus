// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobslistmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobsListModelImpl _$$JobsListModelImplFromJson(Map<String, dynamic> json) =>
    _$JobsListModelImpl(
      jobs: (json['jobs'] as List<dynamic>)
          .map((e) => JobsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$JobsListModelImplToJson(_$JobsListModelImpl instance) =>
    <String, dynamic>{
      'jobs': instance.jobs,
    };
