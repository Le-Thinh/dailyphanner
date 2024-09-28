import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily/repositories/folder_repository.dart';
import 'package:get/get.dart';

import '../models/folder/folder.dart';

class FolderController extends GetxController {
  FolderRepository folderRepository = FolderRepository();
  var folderList = <Folders>[].obs;
  var folderName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFolders();
  }

  Future<void> fetchFolders() async {
    try {
      // Lấy danh sách thư mục từ Firesbase
      final folderDocs = await folderRepository.getFolders();
      folderList.assignAll(folderDocs);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> createFolder(String userId) async {
    if (folderName.value.isNotEmpty) {
      // Tạo một folder mà không cần ID ở đây
      Folders newFolder = Folders(
        folderId: '', // Để trống tại đây, chúng ta sẽ cập nhật sau
        folderName: folderName.value,
        userId: userId,
        createAt: DateTime.now(),
        active: true,
      );

      // Thêm thư mục vào Firestore
      DocumentReference folderDoc =
          await folderRepository.setDataFolder(newFolder);

      newFolder.folderId = folderDoc.id;

      await folderRepository.updateFolderId(newFolder);

      folderName.value = '';
    }
  }
}
