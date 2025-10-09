import 'package:file_picker/file_picker.dart';

class FilePickerService{
  Future <FilePickerResult?> pickFile(List<String> fileTypes) async {
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: fileTypes
    );

    return result;
  }
}