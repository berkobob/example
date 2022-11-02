import Cocoa
import FlutterMacOS
import EventKit

public class ExamplePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "example", binaryMessenger: registrar.messenger)
    let instance = ExamplePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)

    case "hasAccessToReminders":
      EKEventStore().requestAccess(to: .reminder, completion: {(granted, error) in 
        result(granted)
        })

    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
