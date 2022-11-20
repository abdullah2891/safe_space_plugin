
import 'safe_space_plugin_platform_interface.dart';

class SafeSpacePlugin {
  Future<String?> getPlatformVersion() {
    return SafeSpacePluginPlatform.instance.getPlatformVersion();
  }
}
