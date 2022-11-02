import 'package:flutter_test/flutter_test.dart';
import 'package:example/example.dart';
import 'package:example/example_platform_interface.dart';
import 'package:example/example_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockExamplePlatform
    with MockPlatformInterfaceMixin
    implements ExamplePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ExamplePlatform initialPlatform = ExamplePlatform.instance;

  test('$MethodChannelExample is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelExample>());
  });

  test('getPlatformVersion', () async {
    Example examplePlugin = Example();
    MockExamplePlatform fakePlatform = MockExamplePlatform();
    ExamplePlatform.instance = fakePlatform;

    expect(await examplePlugin.getPlatformVersion(), '42');
  });
}
