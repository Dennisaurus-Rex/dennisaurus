import 'package:dennisaurus_dev/core/extensions/build_context_convenience.dart';
import 'package:dennisaurus_dev/logic/theme_coordinator.dart';
import 'package:dennisaurus_dev/models/jobsmodel.dart';
import 'package:dennisaurus_dev/models/theme_model.dart';
import 'package:dennisaurus_dev/ui/components/job_widget.dart';
import 'package:dennisaurus_dev/utils/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class FrontPage extends StatelessWidget {
  final List<JobsModel> jobs;
  final ScrollController _scrollController = ScrollController();

  FrontPage(this.jobs, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: [
        WaveWidget(
          config: CustomConfig(
            colors: [
              context.theme.colorScheme.primary,
              context.theme.colorScheme.secondary,
              context.theme.colorScheme.tertiary,
            ],
            durations: [10000, 20000, 15000],
            heightPercentages: [0.33, 0.66, 0.99],
          ),
          size: Size(double.infinity, double.infinity),
          heightPercentage: 0.5,
          backgroundColor: context.theme.colorScheme.tertiary,
          // backgroundImage:
          //     DecorationImage(image: AssetImage(AssetPaths.images.dennisaurus)),
        ),
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              centerTitle: false,
              // floating: true,
              // snap: true,
              backgroundColor: context.theme.colorScheme.primaryContainer,
              title: const Text(
                'dennisaurus.dev',
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    final theme = ThemeModel.previous();
                    ThemeCoordinator.setTheme(theme);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    final theme = ThemeModel.next();
                    ThemeCoordinator.setTheme(theme);
                  },
                ),
              ],
              expandedHeight: 400.0,
              // collapsedHeight: 100,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                background: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AssetPaths.images.dennisaurus,
                    color: context.theme.colorScheme.primary,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            SliverList.builder(
              itemCount: jobs.length,
              itemBuilder: (ctx, index) {
                final job = jobs[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16,
                  ),
                  child: JobWidget(
                    job,
                    gradient: index.isEven
                        ? JobWidgetGradient.card
                        : JobWidgetGradient.text,
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
