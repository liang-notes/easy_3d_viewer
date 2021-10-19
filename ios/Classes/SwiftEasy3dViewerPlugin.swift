import Flutter
import UIKit

public class SwiftEasy3dViewerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugins.flutter.io/easy_3d_viewer", binaryMessenger: registrar.messenger())
    let instance = SwiftEasy3dViewerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    let viewFactory = Easy3dViewerFactory(messenger: registrar.messenger())
        registrar.register(viewFactory, withId: "plugins.flutter.io/easy_3d_viewer_native_view")
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
