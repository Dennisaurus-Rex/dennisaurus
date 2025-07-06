import 'package:auto_size_text/auto_size_text.dart';
import 'package:dennisaurus_dev/logic/url_launcher.dart';
import 'package:dennisaurus_dev/utils/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class MainAppDeux extends StatelessWidget {
  const MainAppDeux({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              URLLauncher.launchURL(URLLauncherIntent.linkedIn);
            },
            child: FaIcon(FontAwesomeIcons.linkedin),
          ),
          FloatingActionButton(
            onPressed: () {
              URLLauncher.launchURL(URLLauncherIntent.github);
            },
            child: FaIcon(FontAwesomeIcons.github),
          ),
          FloatingActionButton(
            onPressed: () {
              URLLauncher.launchURL(URLLauncherIntent.email);
            },
            child: FaIcon(FontAwesomeIcons.envelope),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        fit: StackFit.expand,
        children: [
          AnimatedMeshGradient(
            colors: [
              Color.fromARGB(255, 90, 0, 140),
              Color.fromARGB(255, 179, 121, 0),
              Color.fromARGB(255, 0, 127, 140),
              Color.fromARGB(255, 0, 127, 140),
            ],
            options: AnimatedMeshGradientOptions(
              grain: .3,
              speed: .01,
              frequency: 5,
              amplitude: 10,
            ),
          ),
          Opacity(
            opacity: .05,
            child: Image.asset(
              AssetPaths.images.logoNoText,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'dennisaurus.dev',
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 200,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AutoSizeText(
                    'app & backend developer',
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                    ),
                  ),
                  Spacer(),
                  AutoSizeText(
                    'I can help you validate, debug and improve your code.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  AutoSizeText(
                    'Doesn\'t matter if it\'s written by human or machine.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
