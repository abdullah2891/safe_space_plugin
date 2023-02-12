import 'package:flutter/material.dart';
import 'package:safe_space_plugin/landing_page/landing_page_widget.dart';
import 'utility/auth.dart';
import 'utility/login_register_page.dart';

class SafeSpaceLandingPage extends StatefulWidget {
  final int param;
  const SafeSpaceLandingPage({super.key, required this.param});

  @override
  State<SafeSpaceLandingPage> createState() => _SafeSpaceLandingPageState();
}

class _SafeSpaceLandingPageState extends State<SafeSpaceLandingPage> {
  @override
  Widget build(BuildContext context) {
    final auth = Auth();
    return StreamBuilder(
      stream: auth.authStateChanges,
      builder: (context, snapshot) {
        if (widget.param == 2) {
          if (snapshot.hasData) {
            return const LandingPageWidget();
          } else {
            return const LoginPage();
          }
        }
        Navigator.pop(context);
        return const SizedBox.shrink();
      },
    );
  }
}
