import 'package:flutter/material.dart';
import 'package:safe_space_plugin/landing_page/landing_page_widget.dart';
// import 'package:safe_space_plugin/teststuff/teststuff.dart';

class SafeSpaceLandingPage extends StatelessWidget {
  final int param;
  const SafeSpaceLandingPage({super.key, required this.param});

  @override
  Widget build(BuildContext context) {
    if (param == 2) {
      return const LandingPageWidget();
    }
    Navigator.pop(context);
    return const SizedBox.shrink();
  }
}
