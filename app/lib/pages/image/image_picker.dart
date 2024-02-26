import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AppImagePicker {
  ImageSource source;

  AppImagePicker({required this.source});

  pick({Function(File?)? onPick}) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: source);
    if (image != null) {
      if (onPick != null) {
        onPick(File(image.path));
      }
    } else {
      if (onPick != null) {
        onPick(null);
      }
    }
  }
}
