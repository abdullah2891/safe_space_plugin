import 'package:flutter/material.dart';
import 'package:safe_space_plugin/landing_page/landing_page_widget.dart';

class SafeSpaceLandingPage extends StatelessWidget {
  final int param;
  const SafeSpaceLandingPage({super.key, required this.param});

  @override
  Widget build(BuildContext context) {
    if (param == 2) {
      Navigator.pop(context);
      return const SizedBox.shrink();
    }
    return const LandingPageWidget();
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Safe Space'),
    //   ),
    //   body: Center(
    //     child: ElevatedButton(
    //       onPressed: () {
    //         Navigator.pop(context);
    //       },
    //       child: const Text('Return'),
    //     ),
    //   ),
    // );
  }
}
