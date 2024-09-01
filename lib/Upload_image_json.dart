import 'package:api_course_project/Controller/image_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadImage extends StatelessWidget {
  // File? image;
  // final _picker = ImagePicker();
  // bool showSpinner = false;
  final imageController controller = Get.put(imageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Upload Image'),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => Container(
              child: controller.image == null
                  ? Center(
                      child: Text('Pick image'),
                    )
                  : Container(
                      height: 100,
                      width: 100,
                      child: Image.file(
                        controller.image.value!,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
