package com.example.player_flutter

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.example.player_flutter.NativeViewFactory

class MainActivity: FlutterActivity() {
    private  val  Method_channel= "HybridPlayer";

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory(Method_channel, NativeViewFactory(flutterEngine.dartExecutor.binaryMessenger))
    }
}
