import 'package:dennisaurus_dev/core/extensions/build_context_convenience.dart';
import 'package:dennisaurus_dev/logic/theme_coordinator.dart';
import 'package:dennisaurus_dev/logic/url_launcher.dart';
import 'package:dennisaurus_dev/ui/animated_background.dart';
import 'package:dennisaurus_dev/ui/components/expandable_fab.dart';
import 'package:dennisaurus_dev/ui/components/gradient_icon.dart';
import 'package:dennisaurus_dev/ui/homepage.dart';
import 'package:dennisaurus_dev/ui/theme_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final _themeCoordinator;

  @override
  void initState() {
    _themeCoordinator = ThemeCoordinator(
      onUpdatedTheme: () {
        setState(() {});
      },
    );
    super.initState();
  }

  // bool _dimmed = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dennisaurus.dev',
      theme: _themeCoordinator.currentTheme,
      home: MyHome(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'dennisaurus.dev',
//       theme: ThemeCoordinator().currentTheme,
//       home: MyHome(),
//     );
//   }
// }

class MyHome extends StatelessWidget {
  // final ThemeCoordinator themeCoordinator;

  const MyHome({super.key});
  @override
  Widget build(BuildContext context) {
    return _devScaffold ??
        Scaffold(
          appBar: AppBar(
            title: const Text(
              'dennisaurus.dev',
            ),
          ),
          body: SinglePageWidget(),
          floatingActionButton: ExpandableFab(
            title: 'Connect',
            children: [
              IconButton(
                // iconSize: 44,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (ctx) => ThemePickerWidget(
                      (theme) {
                        ThemeCoordinator().setTheme(theme);
                        // setState(() {});
                      },
                    ),
                  );
                },
                icon: GradientIcon(
                  FontAwesomeIcons.brush,
                  backgroundColor: context.theme.colorScheme.primaryContainer,
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                    ],
                  ),
                ),
              ),
              IconButton(
                // iconSize: 44,
                onPressed: () async {
                  await URLLauncher.launchURL(URLLauncherIntent.email);
                },
                icon: GradientIcon(
                  FontAwesomeIcons.at,
                  backgroundColor: context.theme.colorScheme.primaryContainer,
                  gradient: LinearGradient(
                    colors: [
                      context.theme.colorScheme.tertiary,
                      context.theme.colorScheme.primary,
                    ],
                  ),
                ),
              ),
              IconButton(
                // iconSize: 44,
                onPressed: () async {
                  await URLLauncher.launchURL(URLLauncherIntent.linkedIn);
                },
                icon: GradientIcon(
                  FontAwesomeIcons.linkedin,
                  backgroundColor: context.theme.colorScheme.primaryContainer,
                  gradient: LinearGradient(
                    colors: [
                      context.theme.colorScheme.secondary,
                      context.theme.colorScheme.tertiary,
                    ],
                  ),
                ),
              ),
              IconButton(
                // iconSize: 44,
                onPressed: () async {
                  await URLLauncher.launchURL(URLLauncherIntent.github);
                },
                icon: GradientIcon(
                  FontAwesomeIcons.github,
                  backgroundColor: context.theme.colorScheme.primaryContainer,
                  gradient: LinearGradient(
                    colors: [
                      context.theme.colorScheme.primary,
                      context.theme.colorScheme.secondary,
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
  }
}

Widget? _devWidget = const AnimatedBackground();

Widget? get _devScaffold {
  final devWidget = _devWidget;
  if (devWidget == null) return null;

  return Scaffold(
    body: devWidget,
  );
}
