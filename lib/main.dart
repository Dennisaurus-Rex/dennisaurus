import 'package:dennisaurus_dev/logic/theme_coordinator.dart';
import 'package:dennisaurus_dev/ui/main_app_deux.dart';
import 'package:flutter/material.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    ThemeCoordinator.attachListener(() {
      setState(() {});
    });
    super.initState();
  }

  // bool _dimmed = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'dennisaurus.dev',
      theme: ThemeCoordinator.currentTheme,
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MainAppDeux();
  }
}

Widget? _devWidget;

// ignore: unused_element
Widget? get _devScaffold {
  final devWidget = _devWidget;
  if (devWidget == null) return null;

  return Scaffold(
    body: devWidget,
  );
}
