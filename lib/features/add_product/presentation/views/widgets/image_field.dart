import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onImageSelected});
  final ValueChanged<File?> onImageSelected;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

bool isLoading = false;
File? imageFile;

class _ImageFieldState extends State<ImageField> {
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          try {
            final ImagePicker picker = ImagePicker();

            final XFile? image = await picker.pickImage(
              source: ImageSource.gallery,
            );

            imageFile = File(image!.path);
            widget.onImageSelected(imageFile);
          } on Exception catch (e) {
            // TODO
          }
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: imageFile != null
                  ? Image.file(imageFile!, fit: BoxFit.cover)
                  : Icon(Icons.upload_file, size: 75),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Visibility(
                visible: imageFile != null,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {
                      imageFile = null;
                      widget.onImageSelected(null);
                      setState(() {});
                    },
                    icon: Icon(Icons.close, size: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
