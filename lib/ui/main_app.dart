import 'package:dennisaurus_dev/logic/theme_coordinator.dart';
import 'package:dennisaurus_dev/logic/url_launcher.dart';
import 'package:dennisaurus_dev/models/jobsmodel.dart';
import 'package:dennisaurus_dev/models/theme_model.dart';
import 'package:dennisaurus_dev/networking/resume_repository.dart';
import 'package:dennisaurus_dev/ui/components/expandable_fab.dart';
import 'package:dennisaurus_dev/ui/front_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<JobsModel> _jobs = List.empty();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final repo = ResumeRepository();
    final response = await repo.getJobs();
    _jobs = response.jobs;
    setState(() {});
  }

  void _launchUrl(URLLauncherIntent intent) async {
    final couldLaunch = await URLLauncher.launchURL(intent);
    if (!couldLaunch) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Something went wrong...'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ExpandableFab(
        title: 'connect',
        children: [
          IconButton.filled(
            onPressed: () {
              _launchUrl(URLLauncherIntent.linkedIn);
            },
            icon: FaIcon(
              FontAwesomeIcons.linkedin,
            ),
          ),
          IconButton.filled(
            onPressed: () async {
              _launchUrl(URLLauncherIntent.github);
            },
            icon: FaIcon(
              FontAwesomeIcons.github,
            ),
          ),
          IconButton.filled(
            onPressed: () async {
              _launchUrl(URLLauncherIntent.email);
            },
            icon: FaIcon(
              FontAwesomeIcons.at,
            ),
          ),
        ],
      ),
      body: FrontPage(_jobs),
    );
  }
}
