package com.example.demande_chifa3

import android.nfc.NdefRecord


import com.google.gson.Gson
import android.content.Intent
import android.nfc.NdefMessage
import android.nfc.NfcAdapter
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.nio.charset.Charset

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.demande_chifa3"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "sendData") {
                val data = call.arguments as Map<String, String>
                sendNFCData(data)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun sendNFCData(data: Map<String, String>) {
        val message = convertMapToJson(data)
        val msg = NdefMessage(
            arrayOf(
                NdefRecord.createMime(
                    "text/plain",
                    message.toByteArray(Charset.forName("UTF-8"))
                )
            )
        )
        val intent = Intent(NfcAdapter.ACTION_NDEF_DISCOVERED)
        intent.putExtra(NfcAdapter.EXTRA_NDEF_MESSAGES, arrayOf(msg))
        startActivity(intent)
    }

    private fun convertMapToJson(data: Map<String, String>): String {
        val gson = Gson()
        return gson.toJson(data)
    }
}
