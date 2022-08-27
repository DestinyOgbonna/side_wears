import 'package:firebase_storage/firebase_storage.dart';

import '../exports/exports.dart';

class FileStorage {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<void> uploadFiles(String filePath, String fileName) async {
    File file = File(filePath);
    try {
      await firebaseStorage.ref('test/$fileName').putFile(file);
    } on FirebaseException catch (e) {
      print('$e');
    }
  }
}
