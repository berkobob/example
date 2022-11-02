import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class Example extends PlatformInterface {
  Example() : super(token: Object());

  static const channel = MethodChannel('example');

  Future<String?> getPlatformVersion() {
    return Example.channel.invokeMethod<String>('getPlatformVersion');
  }

  Future<bool?> hasAccessToReminders() async {
    return await Example.channel.invokeMethod<bool?>('hasAccessToReminders');
  }
}
