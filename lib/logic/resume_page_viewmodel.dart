import 'dart:async';
import 'package:dennisaurus_dev/models/jobsmodel.dart';
import 'package:dennisaurus_dev/networking/resume_repository.dart';
import 'package:fluvvm/fluvvm.dart';

final class ResumeViewmodel extends Viewmodel<ResumeState, ResumeIntent> {
  ResumeViewmodel({
    this.resumeRepository = const ResumeRepository(),
  });

  @override
  void onBound() {
    unawaited(_getJobs());
  }

  final Set<JobsModel> _jobs = {};
  List<JobsModel> get jobs => _jobs.toList();

  final ResumeRepository resumeRepository;

  @override
  void raiseIntent(ResumeIntent intent, {Object? data}) {
    switch (intent) {
      case ResumeIntent.getJobs:
        _getJobs();
        break;
    }
  }

  Future<void> _getJobs() async {
    setState(ResumeState.loading);
    try {
      final responseModel = await resumeRepository.getJobs();
      _jobs.addAll(responseModel.jobs);
      setState(ResumeState.content);
    } catch (e) {
      setState(ResumeState.error);
    }
  }
}

enum ResumeIntent with FluvvmIntent {
  getJobs,
}

enum ResumeState with FluvvmState {
  initial,
  loading,
  content,
  error,
}
