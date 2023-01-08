import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'safe_space_plugin_method_channel.dart';

abstract class SafeSpacePluginPlatform extends PlatformInterface {
  /// Constructs a SafeSpacePluginPlatform.
  SafeSpacePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static SafeSpacePluginPlatform _instance = MethodChannelSafeSpacePlugin();

  /// The default instance of [SafeSpacePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelSafeSpacePlugin].
  static SafeSpacePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SafeSpacePluginPlatform] when
  /// they register themselves.
  static set instance(SafeSpacePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
