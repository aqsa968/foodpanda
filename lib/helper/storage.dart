import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StorageImages {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  Future<void> getFile() async{
    await storage.ref('foodpanda/').getDownloadURL();
    print(storage);
  }
}