import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily/models/folder/folder.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FolderRepository {
  final folders = FirebaseFirestore.instance.collection('folders');
  final user = FirebaseAuth.instance.currentUser;

  Future<DocumentReference> setDataFolder(Folders folder) async {
    try {
      DocumentReference folderDoc = await folders.add({
        'folderName': folder.folderName,
        'userId': folder.userId,
        'createAt': folder.createAt,
        'active': folder.active,
      });
      print('Folder created with ID: ${folderDoc.id}');
      return folderDoc;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<void> updateFolderId(Folders folder) async {
    try {
      await folders.doc(folder.folderId).update({
        'folderid': folder.folderId,
      });
      print('Updated folder ID: ${folder.folderId}');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Folders>> getFolders() async {
    try {
      final snapshot = await folders.get();
      return snapshot.docs.map((doc) {
        return Folders(
          folderId: doc['folderid'],
          folderName: doc['folderName'],
          userId: doc['userId'],
          createAt: (doc['createAt'] as Timestamp).toDate(),
          active: doc['active'],
        );
      }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
