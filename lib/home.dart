import 'package:daily/controllers/auth_controller.dart';
import 'package:daily/repositories/folder_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/folder_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FolderRepository folderRepository = FolderRepository();
  final FolderController controller = Get.put(FolderController());
  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    final userId = authController.userId.value;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 34, 62, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(34, 34, 62, 1),
        title: Text(
          'Folders',
          style: GoogleFonts.raleway(
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        leading: Image.asset(
          'assets/images/daily_logo_2.png',
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/vietnam_flag.png',
                height: 40,
                width: 40,
              ),
            ),
          )
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.folderList.length,
          itemBuilder: (context, index) {
            final folder = controller.folderList[index];
            return Padding(
              padding: EdgeInsets.all(8),
              child: ListTile(
                title: Text(
                  folder.folderName,
                  style: GoogleFonts.raleway(color: Colors.white),
                ),
                subtitle: Text(
                  'Created at: ${folder.createAt}',
                  style: GoogleFonts.raleway(color: Colors.grey),
                ),
                tileColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () {
              Get.defaultDialog(
                backgroundColor: const Color.fromRGBO(219, 219, 219, 1),
                title: "New Folder",
                titleStyle: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                content: Column(
                  children: [
                    Text(
                      'Enter a name for this folder',
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      onChanged: (value) {
                        controller.folderName.value = value;
                        print(value); // Cập nhật giá trị của TextField
                      },
                      cursorColor: Colors.amber,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Colors.grey), // Border khi không focus
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              color: Colors.grey), // Border khi focus
                        ),
                        hintText: 'Folder name.....',
                        hintStyle: GoogleFonts.raleway(
                          textStyle:
                              TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                      ),
                    ),
                  ],
                ),
                cancel: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    side: const BorderSide(color: Colors.amber, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                confirm: Obx(
                  // Sử dụng Obx để theo dõi thay đổi của TextField
                  () => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller.folderName.isEmpty
                          ? Colors.grey
                          : Colors.amber, // Đổi màu khi TextField rỗng
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
                    onPressed: controller.folderName.isEmpty
                        ? null
                        : () {
                            controller.createFolder(userId);
                            Get.back();
                          },
                    child: Text(
                      'Save',
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                // textCancel: 'Cancel',
                // cancelTextColor: Colors.amber,
                // textConfirm: 'Save',
                // confirmTextColor: Colors.white,
                // buttonColor: Colors.amber,
                // onCancel: () {},
                // onConfirm: () {
                //   // Add logic to save the folder name
                //   Get.back(); // Close the dialog after saving
                // },
              );
            },
            child: Text(
              'New Folder',
              style: GoogleFonts.raleway(
                textStyle: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
