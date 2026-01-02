import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;
import 'package:shoely_dashboard/core/services/storage_services.dart';

class FileStorage implements StorageServices {
  final storageReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadImage(File file, String paath) async {
    String fileName = p.basename(file.path);
    String extensionName = p.extension(file.path);
    var fileReference = storageReference.child(
      '$paath$fileName.$extensionName',
    );
    await fileReference.putFile(file);
    var fileUrl = fileReference.getDownloadURL();
    return fileUrl;
  }
}
