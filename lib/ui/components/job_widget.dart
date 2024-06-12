import 'package:auto_size_text/auto_size_text.dart';
import 'package:dennisaurus_dev/core/extensions/build_context_convenience.dart';
import 'package:dennisaurus_dev/models/jobsmodel.dart';
import 'package:dennisaurus_dev/ui/components/gradient_card.dart';
import 'package:dennisaurus_dev/ui/components/gradient_text.dart';
import 'package:flutter/material.dart';

enum JobWidgetGradient { card, text }

class JobWidget extends StatelessWidget {
  const JobWidget(
    this.job, {
    required this.gradient,
  });

  final JobsModel job;
  final JobWidgetGradient gradient;

  @override
  Widget build(BuildContext context) {
    return switch (gradient) {
      JobWidgetGradient.card => _GradientCard(job: job),
      JobWidgetGradient.text => _GradientText(job: job),
    };
  }
}

class _GradientCard extends StatelessWidget {
  const _GradientCard({required this.job});

  final JobsModel job;

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      gradient: LinearGradient(
        colors: [
          context.theme.colorScheme.primary,
          context.theme.colorScheme.tertiary,
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AutoSizeText(
              job.title,
              maxLines: 1,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: context.theme.colorScheme.onPrimary,
                  ),
            ),
            AutoSizeText(
              job.company,
              style: context.theme.textTheme.displaySmall?.copyWith(
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
            const Divider(),
            Text(
              job.location,
              style: TextStyle(
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
            Row(
              children: [
                Text(
                  job.from,
                  style: TextStyle(
                    color: context.theme.colorScheme.onTertiary,
                  ),
                ),
                if (job.to != null)
                  Text(
                    ' - ',
                    style: TextStyle(
                      color: context.theme.colorScheme.onTertiary,
                    ),
                  ),
                if (job.to != null)
                  Text(
                    job.to ?? '',
                    style: TextStyle(
                      color: context.theme.colorScheme.onTertiary,
                    ),
                  ),
              ],
            ),
            const Divider(),
            Text(
              "Variuos tasks:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
            ...job.tasks.map(
              (e) => Text(
                "• $e",
                style: TextStyle(
                  color: context.theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GradientText extends StatelessWidget {
  const _GradientText({required this.job});

  final JobsModel job;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GradientText(
              job.title,
              maxLines: 1,
              gradient: LinearGradient(
                colors: [
                  context.theme.colorScheme.primary,
                  context.theme.colorScheme.tertiary,
                ],
              ),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            GradientText(
              job.company,
              gradient: LinearGradient(
                colors: [
                  context.theme.colorScheme.tertiary,
                  context.theme.colorScheme.primary,
                ],
              ),
              style: context.theme.textTheme.displaySmall,
            ),
            const Divider(),
            Text(job.location),
            Row(
              children: [
                Text(job.from),
                if (job.to != null) const Text(' - '),
                if (job.to != null) Text(job.to ?? ''),
              ],
            ),
            const Divider(),
            // const Spacer(),
            Text(
              "Variuos tasks:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...job.tasks.map((e) => Text("• $e")),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}
