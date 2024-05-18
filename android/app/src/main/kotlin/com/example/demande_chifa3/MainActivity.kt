package com.example.demande_chifa3
import android.content.Intent
import android.nfc.NdefMessage
import android.nfc.NdefRecord
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
                sendNFCData()
            } else {
                result.notImplemented()
            }
        }
    }

    private fun sendNFCData() {
        val text = "Hello, World!"
        val message = NdefMessage(
            arrayOf(
                NdefRecord.createTextRecord(
                    "en",
                    "Hello, World!"
                ),
                NdefRecord.createTextRecord(
                    "en",
                    "Hello, dddd!"
                ),NdefRecord.createTextRecord(
                    "en",
                    "Hello, Wsqdsqqdrld!"
                ),
            ),

        )
        val intent = Intent(NfcAdapter.ACTION_NDEF_DISCOVERED)
        intent.putExtra(NfcAdapter.EXTRA_NDEF_MESSAGES, "arrayOf(message)")
        intent.putExtra("age",15);
        startActivity(intent)
    }
}
