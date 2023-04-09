import 'package:flutter/material.dart';

import 'src/ui/landing_page.dart';
import 'src/utility/config.dart';
import 'src/utility/safe_space_plugin_platform_interface.dart';

export 'src/ui/safe_space_landing_page.dart' show SafeSpaceLandingPage;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final Config config = Config();

class SafeSpacePlugin {
  Future<String?> getPlatformVersion() {
    return SafeSpacePluginPlatform.instance.getPlatformVersion();
  }

  void launchUI(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LandingPage()));
  }
}
