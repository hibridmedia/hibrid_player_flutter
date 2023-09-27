package com.example.player_flutter

import android.content.res.Configuration
import android.view.KeyEvent
import app.hibrid.hibridplayer.HibridPlayer
import io.flutter.embedding.android.FlutterActivity

open class FlutterHibridActivity: FlutterActivity() {

    override fun onPause() {
        HibridPlayer.pause();
        super.onPause()
    }

    override fun onDestroy() {
        HibridPlayer.destroy()
        super.onDestroy()
    }

    override fun onConfigurationChanged(newConfig: Configuration) {
        super.onConfigurationChanged(newConfig)
        HibridPlayer.onConfigurationChanged(newConfig)
    }

    override fun onKeyUp(keyCode: Int, event: KeyEvent?): Boolean {
        HibridPlayer.getVolume()
        return super.onKeyUp(keyCode, event)
    }

    override fun onKeyDown(keyCode: Int, event: KeyEvent?): Boolean {
        HibridPlayer.getVolume()
        return super.onKeyDown(keyCode, event)
    }
}