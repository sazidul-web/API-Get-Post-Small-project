import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class imageController extends GetxController {
  var image = Rxn<File>();
  final ImagePicker _picker = ImagePicker();
  Future getImage() async {
    final PickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (PickedFile != null) {
      // image = File(PickedFile.path);
      image.value = File(PickedFile.path);
    } else {
      print('No image Souce');
    }
  }
}
