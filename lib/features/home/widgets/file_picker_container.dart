import 'package:conversehub/features/home/application/home_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/file_picker_service.dart';


class FilePickerContainer extends StatelessWidget {
  final ColorScheme colorScheme;
  FilePickerContainer({super.key, required this.colorScheme});

  final FilePickerService _filePickerService = FilePickerService();

  Future<void> _pickResume(HomeProvider homeProvider) async {
    FilePickerResult? result = await _filePickerService.pickFile(["pdf", "doc", "docx", "txt"]);

    if (result != null) {
      final file = result.files.single;
      homeProvider.changeResume(file.name, file.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return GestureDetector(
          onTap: () => _pickResume(homeProvider),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.outline),
              borderRadius: BorderRadius.circular(4)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      homeProvider.resumeName ?? "Pick Resume (Optional)",
                      style: const TextStyle(
                        fontSize: 16
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => homeProvider.changeResume(null, null),
                  icon: const Icon(Icons.clear)
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
