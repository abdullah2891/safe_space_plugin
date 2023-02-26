import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'safe_space_plugin_platform_interface.dart';

/// An implementation of [SafeSpacePluginPlatform] that uses method channels.
class MethodChannelSafeSpacePlugin extends SafeSpacePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('safe_space_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
