import Flutter
import UIKit

public class SwiftToastPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "UtilGroup/Toast", binaryMessenger: registrar.messenger())
    
    let instance = SwiftToastPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "showToast" {
        guard let param = call.arguments as? [String:Any] else {
            return
        }
        
        guard let msg = param["msg"] as? String,
            let duration = param["duration"] as? Int,
            let gravity = param["gravity"] as? Int,
            let view = UIApplication.shared.delegate?.window??.rootViewController?.view else {
                return
        }
        
        var position = ToastPosition.bottom
        switch gravity {
        case 0:
            position = .bottom
        case 1:
            position = .center
        case 2:
            position = .top
        default:
            position = .bottom
            
            
        }
        view.makeToast(msg, duration: Double(duration), position: position)
    }
  }
}

