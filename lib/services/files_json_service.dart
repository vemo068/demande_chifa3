import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

Future<File?> saveFileFromJson(String jsonString) async {
  try {
    // Decode the JSON string
    Map<String, dynamic> jsonResponse = json.decode(jsonString);

    // Extract the file content from the JSON response
    String fileBase64 = jsonResponse['fileContent'];

    // Decode the Base64 string to bytes
    List<int> fileBytes = base64.decode(fileBase64);

    // Get the app's documents directory
    Directory appDocDir = await getApplicationDocumentsDirectory();

    // Create a file in the documents directory
    File file = File('${appDocDir.path}/file_name.extension');

    // Write the bytes to the file
    await file.writeAsBytes(fileBytes);

    print('File saved successfully: ${file.path}');
    return file;
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
