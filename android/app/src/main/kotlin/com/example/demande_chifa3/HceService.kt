package com.example.demande_chifa3

import android.nfc.cardemulation.HostApduService
import android.os.Bundle
import android.util.Log
import java.nio.charset.StandardCharsets

class HceService : HostApduService() {

    companion object {
        private const val TAG = "HceService"
        private val NFC_TEXT = "Hello, NFC!".toByteArray(StandardCharsets.UTF_8)
    }

    override fun processCommandApdu(commandApdu: ByteArray?, extras: Bundle?): ByteArray {
        Log.d(TAG, "Received APDU command: ${commandApdu?.toHexString()}")

        return NFC_TEXT
    }

    override fun onDeactivated(reason: Int) {
        Log.d(TAG, "NFC tag emulation deactivated")
    }

    private fun ByteArray.toHexString(): String {
        return joinToString("") { "%02x".format(it) }
    }
}
