import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dennisaurus_dev/core/constants.dart';
import 'package:dennisaurus_dev/core/extensions/build_context_convenience.dart';
import 'package:dennisaurus_dev/core/images.dart';
import 'package:dennisaurus_dev/models/jobsmodel.dart';
import 'package:dennisaurus_dev/networking/resume_repository.dart';
import 'package:dennisaurus_dev/ui/components/job_widget.dart';
import 'package:dennisaurus_dev/ui/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluvvm/fluvvm.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SinglePageWidget extends NotifiedWidget<SinglePageViewmodel> {
  SinglePageWidget() : super(viewmodel: SinglePageViewmodel());
  @override
  bool get keepAlive => true;

  @override
  Widget buildOnNotified(BuildContext context, SinglePageViewmodel viewmodel) {
    return switch (viewmodel.state) {
      SinglePageState.loading => const Center(
          child: CircularProgressIndicator(),
        ),
      SinglePageState.content => _resolvedBuilder(context),
      SinglePageState.error => const Center(
          child: Text('Error'),
        ),
    };
  }

  Widget _resolvedBuilder(BuildContext context) => switch (kIsMobileWeb) {
        true => ListView.builder(
            itemCount: viewmodel._content.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: viewmodel.widgetAtIndex(index),
            ),
          ),
        false => CarouselSlider.builder(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              viewportFraction: 0.65,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              pageSnapping: false,
              autoPlay: true,
              initialPage: 0,
              scrollDirection: Axis.vertical,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            ),
            itemCount: viewmodel._content.length,
            itemBuilder: (context, index, pageIndex) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: viewmodel.widgetAtIndex(index),
            ),
          ),
      };
}

class SinglePageViewmodel extends Viewmodel<SinglePageState, SinglePageIntent> {
  SinglePageViewmodel({
    this.resumeRepository = const ResumeRepository(),
  });

  Set<Object> _content = {};

  @override
  void onBound() {
    _getJobs();
  }

  final ResumeRepository resumeRepository;

  @override
  void raiseIntent(SinglePageIntent intent, {Object? data}) {
    // _getJobs();
  }

  Widget widgetAtIndex(int index) {
    final item = _content.elementAt(index);
    if (item is JobsModel) {
      return JobWidget(
        item,
        gradient: index.isOdd ? JobWidgetGradient.card : JobWidgetGradient.text,
      );
    } else if (item is ImageCollectionModel) {
      return ImageCollectionWidget.fromModel(item);
    } else {
      throw Exception('Unknown item type');
    }
  }

  Future<void> _getJobs() async {
    setState(SinglePageState.loading);
    try {
      final responseModel = await resumeRepository.getJobs();
      _content.addAll(responseModel.jobs);
      _setInfo();
      setState(SinglePageState.content);
    } catch (e) {
      setState(SinglePageState.error);
    }
  }

  void _setInfo() {
    final imageCollections = {
      ImageCollectionModel(
        "Languages I prefer:",
        [
          ImageKey.dart,
          ImageKey.swift,
          ImageKey.kotlin,
          ImageKey.typescript,
        ],
        100,
        [
          context.theme.colorScheme.primaryContainer,
          context.theme.colorScheme.secondaryContainer,
        ],
      ),
      ImageCollectionModel(
        'Platforms I know:',
        [
          FontAwesomeIcons.android,
          FontAwesomeIcons.apple,
          ImageKey.flutter,
          ImageKey.gcp,
          ImageKey.firebase,
        ],
        100,
        [
          context.theme.colorScheme.secondaryContainer,
          context.theme.colorScheme.tertiaryContainer,
        ],
      ),
      ImageCollectionModel(
        'Tools I use:',
        [
          ImageKey.vsCode,
          ImageKey.xcode,
          ImageKey.androidStudio,
          FontAwesomeIcons.github,
          FontAwesomeIcons.gitlab,
          FontAwesomeIcons.slack,
          FontAwesomeIcons.jira,
          FontAwesomeIcons.trello,
        ],
        100,
        [
          context.theme.colorScheme.tertiaryContainer,
          context.theme.colorScheme.primaryContainer,
        ],
      ),
    };

    _content.addAll(imageCollections);
  }
}

enum SinglePageState with FluvvmState {
  loading,
  content,
  error,
}

enum SinglePageIntent with FluvvmIntent {
  fetchContent,
}
