import 'package:flutter/material.dart';

import '../utility/auth.dart';
import '../utility/login_register_page.dart';
import 'landing_page_widget.dart';

class SafeSpaceLandingPage extends StatefulWidget {
  final int param;
  const SafeSpaceLandingPage({super.key, required this.param});

  @override
  State<SafeSpaceLandingPage> createState() => _SafeSpaceLandingPageState();
}

class _SafeSpaceLandingPageState extends State<SafeSpaceLandingPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth.authStateChanges,
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
