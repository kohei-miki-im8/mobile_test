package com.aimate.econa_mobile_app

import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "app.security_integrity"
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "isDeviceCompromised" -> {
                    result.success(isDeviceCompromised(this))
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun isDeviceCompromised(context: Context): Boolean {
        return isDeveloperModeEnabled(context) || hasTestKeys() || hasSuBinary() || hasDangerousPackages(context)
    }

    private fun isDeveloperModeEnabled(context: Context): Boolean {
        return try {
            Settings.Global.getInt(
                context.contentResolver,
                Settings.Global.DEVELOPMENT_SETTINGS_ENABLED, 0
            ) == 1
        } catch (e: Exception) {
            false
        }
    }

    private fun hasTestKeys(): Boolean {
        return Build.TAGS?.contains("test-keys") == true
    }

    private fun hasSuBinary(): Boolean {
        val paths = arrayOf(
            "/system/bin/su",
            "/system/xbin/su",
            "/sbin/su",
            "/system/bin/.ext/su",
            "/system/usr/we-need-root/su",
            "/system/xbin/daemonsu",
            "/system/sd/xbin/su",
            "/system/bin/failsafe/su",
            "/data/local/su",
            "/su/bin/su"
        )
        return paths.any { path -> File(path).exists() }
    }

    private fun hasDangerousPackages(context: Context): Boolean {
        val pkgs = listOf(
            "com.topjohnwu.magisk",
            "eu.chainfire.supersu",
            "com.koushikdutta.superuser",
            "com.noshufou.android.su",
            "com.thirdparty.superuser",
            "com.yellowes.su",
            "com.devadvance.rootcloak"
        )
        val pm: PackageManager = context.packageManager
        return pkgs.any {
            try {
                pm.getPackageInfo(it, 0)
                true
            } catch (e: Exception) {
                false
            }
        }
    }
}
