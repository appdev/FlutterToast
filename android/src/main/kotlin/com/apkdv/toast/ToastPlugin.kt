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
        const val CHANNEL = "UtilGroup/Toast"
        const val ShowToast = "showToast"
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), CHANNEL)
            channel.setMethodCallHandler(ToastPlugin(registrar.activeContext()))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == ShowToast) {
            val msg = call.argument<String>("msg")
            val duration = call.argument<Int>("duration")
            val gravity = call.argument<Int>("gravity")
            msg?.let {
                ToastUtil.makeText(context, it,
                        if (duration == 1) Toast.LENGTH_SHORT else Toast.LENGTH_LONG,
                        when (gravity) {
                            0 -> Gravity.BOTTOM
                            1 -> Gravity.CENTER
                            else -> Gravity.TOP
                        }).show()
            }
            result.success("Toast Success")
        } else {
            result.notImplemented()
        }
    }
}
