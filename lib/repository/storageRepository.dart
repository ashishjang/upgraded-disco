import 'dart:io';

import 'package:you_chat/provider/baseAuthenticationProvider.dart';
import 'package:you_chat/provider/storageProvider.dart';

class StorageRepository{
  BaseStorageProvider storageProvider = StorageProvider();
  Future<String> uploadImage (File file, String path)=> storageProvider.uploadImage(file , path);
}