import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:safe_space_plugin/src/utility/safe_space_plugin_method_channel.dart';

void main() {
  MethodChannelSafeSpacePlugin platform = MethodChannelSafeSpacePlugin();
  const MethodChannel channel = MethodChannel('safe_space_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
