package com.example.demande_chifa3
// import android.nfc.cardemulation.HostApduService;
// import android.os.Bundle;
// import android.util.Log;

// import org.json.JSONException;
// import org.json.JSONObject;

// import java.util.Arrays;

// public class MyHostApduService extends HostApduService {
//     private static final String TAG = "MyHostApduService";
//     private static final byte[] SELECT_APDU = {...}; // Your SELECT APDU command

//     @Override
//     public byte[] processCommandApdu(byte[] commandApdu, Bundle extras) {
//         Log.d(TAG, "Received APDU: " + bytesToHex(commandApdu));
//         // Check the command APDU and generate response accordingly
//         if (Arrays.equals(commandApdu, SELECT_APDU)) {
//             String jsonData = extras.getString("jsonData");
//             if (jsonData != null) {
//                 try {
//                     JSONObject jsonObject = new JSONObject(jsonData);
//                     int id = jsonObject.getInt("id");
//                     String name = jsonObject.getString("name");
//                     String phone = jsonObject.getString("phone");

//                     // Process the JSON data and generate response
//                     String responseData = "ID: " + id + ", Name: " + name + ", Phone: " + phone;
//                     return responseData.getBytes();
//                 } catch (JSONException e) {
//                     Log.e(TAG, "Error parsing JSON data: " + e.getMessage());
//                     return UNKNOWN_COMMAND_RESPONSE;
//                 }
//             } else {
//                 Log.e(TAG, "No JSON data received.");
//                 return UNKNOWN_COMMAND_RESPONSE;
//             }
//         } else {
//             return UNKNOWN_COMMAND_RESPONSE;
//         }
//     }

//     @Override
//     public void onDeactivated(int reason) {
//         Log.d(TAG, "Deactivated: " + reason);
//     }

//     // Helper method to convert byte array to hex string
//     private String bytesToHex(byte[] bytes) {
//         StringBuilder sb = new StringBuilder();
//         for (byte b : bytes) {
//             sb.append(String.format("%02X", b));
//         }
//         return sb.toString();
//     }
// }
