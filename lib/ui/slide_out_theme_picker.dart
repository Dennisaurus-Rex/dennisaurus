// import 'package:dennisaurus_dev/core/extensions/build_context_convenience.dart';
// import 'package:dennisaurus_dev/models/theme_key.dart';
// import 'package:dennisaurus_dev/models/theme_model.dart';
// import 'package:dennisaurus_dev/ui/slide_out_widget.dart';
// import 'package:flutter/material.dart';

// class SlideOutThemePicker extends StatelessWidget {
//   const SlideOutThemePicker({super.key, required this.margin});
//   final double margin;
//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = context.mediaQuery.size;
//     return CustomScrollView(
//       slivers: [
//         SliverList(
//           delegate: SliverChildListDelegate.fixed(
//             ThemeKey.values
//                 .map(
//                   (e) => SlideOutWidget(
//                     stickoutMargin: margin,
//                     fullSize: Size(
//                       screenSize.width * 0.5,
//                       screenSize.height * 0.2,
//                     ),
//                     child: ThemeWidget(
//                       theme: ThemeModel.fromKey(e),
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }
