package com.example.demande_chifa3
import android.nfc.cardemulation.HostApduService
import android.os.Bundle
import android.util.Log
import java.nio.charset.Charset

class MyHostApduService : HostApduService() {

    companion object {
        private const val TAG = "MyHostApduService"
        private const val RESPONSE_STATUS_SUCCESS = "9000"
        private const val AID = "F0010203040506"
        private const val MESSAGE = "Hello, NFC World!"
    }

    override fun processCommandApdu(commandApdu: ByteArray?, extras: Bundle?): ByteArray {
        commandApdu?.let {
            val command = String(it, Charset.defaultCharset())
            Log.d(TAG, "Received command: $command")
            if (command == AID) {
                Log.d(TAG, "Sending response: $MESSAGE")
                return MESSAGE.toByteArray(Charset.defaultCharset())
            }
        }
        return byteArrayOf()
    }

    override fun onDeactivated(reason: Int) {
        Log.d(TAG, "NFC tag deactivated: $reason")
    }
}
