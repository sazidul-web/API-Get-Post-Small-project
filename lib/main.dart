import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Homepage.dart';
import 'CoustomJaosn.dart';
import 'complexepostmodel.dart';
import 'Singup&loginPage_Post_API.dart';
import 'Upload_image_json.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      // home: Homepage(),
      // home: CoustomJaosn(),
      // home: complexepostmodel(),
      // home: Singup__loginPage_Post_API(),
      home: UploadImage(),
    );
  }
}
