import 'package:carousel_slider/carousel_slider.dart';
import 'package:dennisaurus_dev/core/extensions/build_context_convenience.dart';
import 'package:dennisaurus_dev/logic/resume_page_viewmodel.dart';
import 'package:dennisaurus_dev/ui/components/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:fluvvm/fluvvm.dart';

final class ResumeWidget extends NotifiedWidget<ResumeViewmodel> {
  ResumeWidget({
    super.key,
    required super.viewmodel,
  });

  @override
  bool get keepAlive => true;

  final CarouselController _controller = CarouselController();

  @override
  Widget buildOnNotified(BuildContext context, ResumeViewmodel viewmodel) {
    return switch (viewmodel.state) {
      ResumeState.initial => const SizedBox.shrink(),
      ResumeState.loading => const Center(
          child: CircularProgressIndicator(),
        ),
      ResumeState.content => CarouselSlider.builder(
          itemCount: viewmodel.jobs.length,
          carouselController: _controller,
          key: const ValueKey('resume'),
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            viewportFraction: 0.7,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            initialPage: 0,
            scrollDirection: Axis.vertical,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          ),
          itemBuilder: (context, index, pageIndex) {
            final job = viewmodel.jobs[index];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
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
                      const Spacer(),
                      Text(
                        "Variuos tasks:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ...job.tasks.map((e) => Text("• $e")),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ResumeState.error => const Center(
          child: Text('Error'),
        ),
    };
  }
}
