package com.example.player_flutter

import io.flutter.embedding.engine.FlutterEngine

class MainActivity:  FlutterHibridActivity() {
    private  val  Method_channel= "HybridPlayer";

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory(Method_channel, NativeViewFactory(flutterEngine.dartExecutor.binaryMessenger))
    }

}
