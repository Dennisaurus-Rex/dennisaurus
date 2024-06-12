import 'package:freezed_annotation/freezed_annotation.dart';

part 'jobsmodel.freezed.dart';
part 'jobsmodel.g.dart';

@freezed
class JobsModel with _$JobsModel {
  factory JobsModel({
    required String title,
    required String company,
    required String location,
    required String from,
    String? to,
    required List<String> tasks,
  }) = _JobsModel;

  factory JobsModel.fromJson(Map<String, dynamic> json) =>
      _$JobsModelFromJson(json);
}
