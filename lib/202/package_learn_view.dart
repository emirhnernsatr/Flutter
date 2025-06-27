import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/packege/loading_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchURL('https://pub.dev/packages/URLLauncher');

      }),
      body: LoadingBar(),
    );
  }

  void _launchURL(String url) async {
    if (!await canLaunch(url)) {
      await launch(url);
    }
  }
}