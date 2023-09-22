import UIKit
import Flutter
import HibridStreamPlayer

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLNativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }

    /// Implementing this method is only necessary when the `arguments` in `createWithFrame` is not `nil`.
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
          return FlutterStandardMessageCodec.sharedInstance()
    }
}

class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: HibridPlayerView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = HibridPlayerView()
        super.init()
        // iOS views can be created here
        createNativeView(view: _view, arguments: args)
    }

    func view() -> UIView {
        return _view
    }

    func createNativeView(view _view: HibridPlayerView, arguments arg0: Any?){
        _view.backgroundColor = UIColor.blue
        
        guard let dict = arg0 as? Dictionary<String, Any> else {
            return
        }
        
        if let license = dict["license"] as? String,
           let channelKey = dict["channelKey"] as? String {
            HibridPlayerAccess.license = license
            HibridPlayerAccess.channelKey = channelKey
            HibridPlayerAccess.autoplay = false

            _view.playHibridPlayer(channelKey: channelKey)
        }
//        var player = nativeLabel.playHibridPlayer()
//        nativeLabel.textColor = UIColor.white
//        nativeLabel.textAlignment = .center
//        nativeLabel.frame = CGRect(x: 0, y: 0, width: 180, height: 48.0)
    }
}
