import 'dart:io';

abstract class StorageServices {
  Future<String> uploadImage(File file,String paath);
}
