// import 'dart:math';

import 'package:dennisaurus_dev/models/jobsmodel.dart';
import 'package:dennisaurus_dev/networking/resume_repository.dart';
import 'package:dennisaurus_dev/ui/components/job_widget.dart';
import 'package:dennisaurus_dev/utils/build_context_functional.dart';
import 'package:flutter/material.dart';

final class ResumePage extends StatefulWidget {
  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  bool _isLoading = true;
  List<JobsModel> _jobs = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final repo = ResumeRepository();
    final response = await repo.getJobs();
    _jobs = response.jobs;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListWheelScrollView(
      itemExtent: context.mediaQueryHeight * 0.7,
      physics: AlwaysScrollableScrollPhysics(),
      diameterRatio: 10,
      offAxisFraction: 0.9,
      children: [
        ...List.generate(
          _jobs.length,
          (index) {
            final job = _jobs[index];
            return Padding(
              padding: const EdgeInsets.all(32.0),
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
    );
  }
}

// final class ParallaxList extends StatefulWidget {
//   @override
//   State<ParallaxList> createState() => _ParallaxListState();
// }

// class _ParallaxListState extends State<ParallaxList> {
//   late final PageController _pageController;
//   double _page = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
//     _pageController.addListener(() {
//       setState(() {
//         _page = _pageController.page ?? 0;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//         controller: _pageController,
//         scrollDirection: Axis.vertical,
//         pageSnapping: false,
//         itemCount: 4,
//         itemBuilder: (context, index) {
//           final offset = _page - index;
//           final absOffset = offset.abs();
//           final colorValue = absOffset * 255;
//           print('color: $colorValue and offset: $absOffset at index: $index');
//           return Padding(
//             padding: const EdgeInsets.all(32.0),
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               clipBehavior: Clip.hardEdge,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Transform.translate(
//                     offset: Offset(0, offset * 100),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             Colors.tealAccent,
//                             Colors.red,
//                           ],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Image.asset(
//                   //   AssetPaths.icons.vsc,
//                   //   fit: BoxFit.none,
//                   //   alignment: Alignment(0, offset * 10),
//                   // ),
//                   // AnimatedBuilder(
//                   //   animation: _pageController,
//                   //   builder: (c, w) {
//                   //     final double pageOffset =
//                   //         (_pageController.position.haveDimensions)
//                   //             ? _page - index
//                   //             : 0;
//                   //     // double gauss =
//                   //     //     exp(-(pow((pageOffset.abs() - 0.5), 2) / 0.08));
//                   //     // double realOffset = (-32 * gauss * pageOffset.sign);
//                   //     // print(gauss);
//                   //     print(pageOffset);
//                   //     return
//                   //   },
//                   // ),
//                   Text('name $index'),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// @immutable
// final class ParallaxList extends StatefulWidget {
//   final Widget Function(BuildContext context, int index) itemBuilder;
//   final int? itemCount;

//   ParallaxList({super.key, required this.itemBuilder, this.itemCount});

//   @override
//   State<ParallaxList> createState() => _ParallaxListState();
// }

// class _ParallaxListState extends State<ParallaxList> {
//   final PageController _pageController = PageController();
//   double _scrollOffset = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController.addListener(() {
//       setState(() {
//         _scrollOffset = _pageController.page ?? 0;
//         print('scrollOffset: $_scrollOffset');
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//         controller: _pageController,
//         pageSnapping: false,
//         // controller: PageController(viewportFraction: 0.4),
//         scrollDirection: Axis.vertical,
//         itemCount: 4,
//         itemBuilder: (context, index) {
//           return _ListItem(
//             index: index,
//             offset: _scrollOffset,
//           );
//         },
//       ),
//     );
//   }
// }

// class _ListItem extends StatelessWidget {
//   final int index;
//   final double offset;

//   _ListItem({
//     required this.index,
//     required this.offset,
//   });

//   double get _parallaxOffset => (index.roundToDouble() - offset).abs();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 24,
//         vertical: 16,
//       ),
//       child: AspectRatio(
//         aspectRatio: 16 / 9,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: Stack(
//             children: [
//               _buildParallaxBackground(context),
//               // _buildGradient(),
//               _buildTitleAndSubtitle(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildParallaxBackground(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     // final offset = _parallaxOffset * 100;
//     final colorValueDouble = _parallaxOffset * 255.toDouble();
//     print('index: $index, colorValueDouble: $colorValueDouble');
//     final colorValue = colorValueDouble.toInt();
//     // print('index: $index, colorValue: $colorValue');
//     // print('index: $index, offset: $offset');
//     print('index: $index, parallaxOffset: $_parallaxOffset');
//     return Container(
//       height: height,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Color.fromRGBO(
//           colorValue,
//           max(colorValue, 120),
//           max(colorValue, 120),
//           1,
//         ),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             bottom: _parallaxOffset * 100,
//             child: Image.asset(
//               AssetPaths.icons.vsc,
//               fit: BoxFit.cover,
//               width: width,
//               height: height,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Widget _buildGradient() {
//   //   return Positioned.fill(
//   //     child: DecoratedBox(
//   //       decoration: BoxDecoration(
//   //         gradient: LinearGradient(
//   //           colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
//   //           begin: Alignment.topCenter,
//   //           end: Alignment.bottomCenter,
//   //           stops: const [0.6, 0.95],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }

//   Widget _buildTitleAndSubtitle() {
//     return Positioned(
//       left: 20,
//       bottom: 20,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'name',
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             'country',
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // final class _ParallaxFlowDelegate extends FlowDelegate {
// //   final ScrollableState scrollable;
// //   final BuildContext listItemContext;
// //   final GlobalKey backgroundImageKey;
// //   final int index;

// //   _ParallaxFlowDelegate({
// //     required this.scrollable,
// //     required this.listItemContext,
// //     required this.backgroundImageKey,
// //     required this.index,
// //   });

// //   @override
// //   void paintChildren(FlowPaintingContext context) {
// //     // create a parallax effect
// //     // final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
// //     final listItemBox = listItemContext.findRenderObject() as RenderBox;
// //     final backgroundBox =
// //         backgroundImageKey.currentContext!.findRenderObject() as RenderBox;

// //     final listItemOffset = listItemBox.localToGlobal(Offset.zero);
// //     // final backgroundOffset = backgroundBox.localToGlobal(Offset.zero);
// //     final scrollOffset = scrollable.position.pixels;
// //     print('scrollOffset: $scrollOffset');
// //     print('listItemOffset: ${listItemOffset.dy}');

// //     final listItemHeight = listItemBox.size.height;
// //     // final listItemWidth = listItemBox.size.width;
// //     final backgroundHeight = backgroundBox.size.height;

// //     final relativeOffset = listItemOffset.dy - scrollOffset;
// //     final parallaxOffset = relativeOffset / listItemHeight * backgroundHeight;

// //     final x = listItemOffset.dx;

// //     context.paintChild(
// //       0,
// //       transform: Matrix4.translationValues(x, -parallaxOffset, 0),
// //     );
// //   }

// //   @override
// //   bool shouldRepaint(_ParallaxFlowDelegate oldDelegate) {
// //     return true;
// //     // return scrollable != oldDelegate.scrollable ||
// //     //     listItemContext != oldDelegate.listItemContext ||
// //     //     backgroundImageKey != oldDelegate.backgroundImageKey;
// //   }

// //   @override
// //   BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
// //     return BoxConstraints.tightFor(
// //       width: constraints.maxWidth,
// //     );
// //   }
// // }
