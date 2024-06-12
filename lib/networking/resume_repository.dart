import 'package:dennisaurus_dev/debug/debug_conditions.dart';
import 'package:dennisaurus_dev/debug/debug_print.dart';
import 'package:dennisaurus_dev/models/jobslistmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:fluvvm/fluvvm.dart';

final class ResumeRepository {
  const ResumeRepository({
    this.baseUrl = 'https://dennisaurus-rex.github.io',
  });

  final String baseUrl;

  Future<JobsListModel> getJobs() async {
    toggleDebugNetwork(true);
    final request = NetworkRequest(
      baseUrl: baseUrl,
      path: 'webpage_json_content/content.json',
    );
    try {
      final response = await request.fire();
      final jobsListModel = await compute(JobsListModel.fromJson, response);
      return jobsListModel;
    } catch (e) {
      conditionedPrint(message: e, tag: runtimeType.toString());
      rethrow;
    }
  }
}
