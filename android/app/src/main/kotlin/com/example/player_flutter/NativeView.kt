package com.example.player_flutter

import android.content.Context
import android.view.View
import app.hibrid.hibridplayer.view.HibridPlayerView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView


internal class NativeView(
    private var context: Context,
    private var id: Int,
    private var args: Map<String, Any>,
    private var messenger: BinaryMessenger
) : PlatformView {
    lateinit var textView: HibridPlayerView
    override fun getView(): View {
        return textView
    }

    override fun dispose() {}

    init {
        var channelKey = args["channelKey"].toString()
        var license = args["license"].toString()
        textView = HibridPlayerView(context,channelKey = channelKey,license = license)
    }
}
