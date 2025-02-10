import 'dart:io';

import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  ImagePreview({super.key, required this.path});
  String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(File(path)),
    );
  }
}
