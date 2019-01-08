package com.apkdv.toast

import android.content.Context
import android.view.Gravity
import android.widget.Toast
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar


class ToastPlugin(val context: Context) : MethodCallHandler {
    companion object {

        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "")
            channel.setMethodCallHandler(ToastPlugin(registrar.activeContext()))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
            result.notImplemented()

    }
}
