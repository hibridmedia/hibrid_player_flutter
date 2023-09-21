package com.example.player_flutter

import android.content.Context
import android.os.Build
import androidx.annotation.RequiresApi
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import com.example.player_flutter.NativeView

class NativeViewFactory(private val messenger: BinaryMessenger) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    @RequiresApi(Build.VERSION_CODES.N)
    override fun create(context: Context, id: Int, args: Any?): PlatformView {
        return NativeView(
            context, id, args as Map<String, Any>, messenger
        )
    }
}