import Flutter
import UIKit

public class Easy3dViewerFactory: NSObject, FlutterPlatformViewFactory {

    // MARK: Variables
    private var messenger: FlutterBinaryMessenger

    // MARK: Initialize
    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
    }

    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return Easy3dViewer(frame: frame, viewId: viewId, args: args, messenger: self.messenger)
    }

    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }

}
