import 'package:dennisaurus_dev/models/jobsmodel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'jobslistmodel.freezed.dart';
part 'jobslistmodel.g.dart';

@freezed
abstract class JobsListModel with _$JobsListModel {
  factory JobsListModel({
    required List<JobsModel> jobs,
  }) = _JobsListModel;

  factory JobsListModel.fromJson(Map<String, Object?> json) =>
      _$JobsListModelFromJson(json);
}
