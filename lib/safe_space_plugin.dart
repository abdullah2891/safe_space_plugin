import 'package:safe_space_plugin/src/ui/landing_page.dart';
import 'utility/safe_space_plugin_platform_interface.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class SafeSpacePlugin {
  Future<String?> getPlatformVersion() {
    return SafeSpacePluginPlatform.instance.getPlatformVersion();
  }

  void launchUI(BuildContext context) {
    // Navigator.of(context).pushNamed("/LandingPage");
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LandingPage()));
  }
}
