// ignore_for_file: avoid_print

import 'package:dennisaurus_dev/debug/debug_conditions.dart';
import 'package:flutter/foundation.dart';
import 'dart:core' as core;

import 'package:flutter/material.dart';

/// Prints a message to the console.
///
/// The message is printed in a box with a tag.
/// Only prints if [kDebugMode] is true.
void conditionedPrint({
  required core.Object message,
  required core.String tag,
  core.bool conditioned = true,
}) {
  if (!kDebugMode || !conditioned) return;
  core.print(tag._printableTag);
  core.print(message);
  core.print(tag._printableTag);
}

extension _TAG on core.String {
  core.String get _printableTag {
    core.String tag = this;
    if (!tag.startsWith('---------- ')) tag = '---------- $tag';
    if (!tag.endsWith(' ----------')) tag = '$tag ----------';
    return tag;
  }
}

extension TAG on core.Object {
  core.String get tag => runtimeType.toString();
}

extension DebugPrint on Widget {
  void print(core.String message) {
    conditionedPrint(message: message, tag: tag, conditioned: kDebugWidget);
  }
}
