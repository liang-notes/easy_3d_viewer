import Flutter
import UIKit

typealias ErrorCallback = (_ errorMessage: String) -> Void

public class Easy3dViewer: NSObject, FlutterPlatformView {

    private var easy3dViewController: Easy3dViewerController
    
    private var channel: FlutterMethodChannel


    init(frame: CGRect, viewId: Int64, args: Any?, messenger: FlutterBinaryMessenger) {
        self.channel = FlutterMethodChannel(name: "plugins.flutter.io/easy_3d_viewer_native_view", binaryMessenger: messenger)
        self.easy3dViewController = Easy3dViewerController()
        self.easy3dViewController.channel = channel

        super.init()
        self.handleMethodChannel()

    }

    public func view() -> UIView {
        return self.easy3dViewController.view
    }

    //MARK: - Private functions

    private func handleMethodChannel() {
        self.channel.setMethodCallHandler { [weak self] (call, result) in
            guard let strongSelf = self else { return }
            switch call.method {
//            case "resetCamera":
//                strongSelf.resetCamera(result: result)
//            case "reloadView":
//                strongSelf.reloadView(args: call.arguments, result: result)
//            case "rendererDisplay":
//                strongSelf.retrieveRendererDisplay(result: result)
            default:
                break
            }
        }
    }

//    private func resetCamera(result: FlutterResult) {
//        self.remote3dViewController.resetCameraPosition()
//        result(true)
//    }

//    private func retrieveRendererDisplay(result: FlutterResult) {
//        guard let rendererDisplay = self.remote3dViewController.rendererStatus() else {
//            debugPrint("displays options not available")
//            return
//        }
//        result(rendererDisplay.toMap())
//    }

//    private func reloadView(args: Any?, result: FlutterResult) {
//        self.rendererConfig(from: args, rendererCallback: { [weak self] (rendererConfig) in
//            guard let strongSelf = self else { return }
//            strongSelf.remote3dViewController.reloadView(rendererConfig: rendererConfig)
//        }, errorCallback: { [weak self] (errorMessage) in
//            debugPrint(errorMessage)
//        })
//    }

//    private func rendererConfig(from args: Any?, rendererCallback: RendererConfigCallback, errorCallback: ErrorCallback) {
//        guard let arguments = args as? [String: Any] else {
//            return errorCallback("Expected arguments: \(Remote3dArguments.expected())")
//        }
//
//        guard let egoCarModelName = arguments[Remote3dArguments.egoModelName.rawValue] as? String else {
//            return errorCallback("Expected string argument: egoModelName")
//        }
//
//        guard let steering = arguments[Remote3dArguments.isLeftSteering.rawValue] as? Bool else {
//            return errorCallback("Expected bool argument: isLeftSteering")
//        }
//
//        let executionPathArgs = arguments[Remote3dArguments.executionPath.rawValue] as? String
//        let executionPath = self.validateExecutionPath(executionPath: executionPathArgs)
//
//        guard let egoModelPath = arguments[Remote3dArguments.egoCarModelPath.rawValue] as? String else {
//            return errorCallback("Expected string argument: egoCarModelPath")
//        }
//
//        let calibrationMaskName = arguments[Remote3dArguments.calibrationMaskName.rawValue] as? String ?? RendererConfig.CALIBRATION_MASKS_ROOT_DIRECTORYNAME
//
//        var isDirectory = ObjCBool(true)
//        var isFile = ObjCBool(false)
//
//        let rendererConfig = RendererConfig()
//
//        rendererConfig.egoCarPath = egoModelPath
//        rendererConfig.egoCarModelName = egoCarModelName
//        rendererConfig.cameraResourcePath = executionPath
//        rendererConfig.calibrationPath = executionPath?.appending(Remote360Constants.MEI_CALIBRATION)
//        rendererConfig.fromSteering(isLeftSteering: steering, calibrationMaskName: calibrationMaskName)
//
//        guard
//            let egoCarPath = rendererConfig.egoCarPath,
//            let cameraResourcePath = rendererConfig.cameraResourcePath,
//            let calibrationMaskPath = rendererConfig.calibrationMaskPath,
//            let egoCarSettingsPath = rendererConfig.egoCarSettingsPath,
//            fileManager.fileExists(atPath: egoCarPath, isDirectory: &isDirectory),
//            fileManager.fileExists(atPath: cameraResourcePath, isDirectory: &isDirectory),
//            fileManager.fileExists(atPath: calibrationMaskPath, isDirectory: &isDirectory),
//            fileManager.fileExists(atPath: egoCarSettingsPath, isDirectory: &isFile)
//            else {
//                return errorCallback("One or more files are invalid: \(rendererConfig.description)")
//        }
//
//        rendererCallback(rendererConfig)
//    }

  
}
