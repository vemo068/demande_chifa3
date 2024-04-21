import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
class DemandeController extends GetxController {

var photoPath = "photo: ".obs;
  var idPath = "id: ".obs;
  var documentPath = "document: ".obs;

  void selectFile(String fileType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String? filePath = result.files.single.path;
      switch (fileType) {
        case "photo":
          photoPath.value = "photo: $filePath";
          break;
        case "id":
          idPath.value = "id: $filePath";
          break;
        case "document":
          documentPath.value = "document: $filePath";
          break;
      }
    }
  }

  
}