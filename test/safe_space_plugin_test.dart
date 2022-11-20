import 'package:flutter_test/flutter_test.dart';
import 'package:safe_space_plugin/safe_space_plugin.dart';
import 'package:safe_space_plugin/safe_space_plugin_platform_interface.dart';
import 'package:safe_space_plugin/safe_space_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSafeSpacePluginPlatform
    with MockPlatformInterfaceMixin
    implements SafeSpacePluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SafeSpacePluginPlatform initialPlatform = SafeSpacePluginPlatform.instance;

  test('$MethodChannelSafeSpacePlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSafeSpacePlugin>());
  });

  test('getPlatformVersion', () async {
    SafeSpacePlugin safeSpacePlugin = SafeSpacePlugin();
    MockSafeSpacePluginPlatform fakePlatform = MockSafeSpacePluginPlatform();
    SafeSpacePluginPlatform.instance = fakePlatform;

    expect(await safeSpacePlugin.getPlatformVersion(), '42');
  });
}
