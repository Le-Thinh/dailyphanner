import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/auth/authentication_repository.dart';

class AuthController extends GetxController {
  final userId = FirebaseAuth.instance.currentUser!.uid.obs;
  RxBool obscure = true.obs;
  Rx<IconData> icon = (CupertinoIcons.eye_fill).obs;
  final AuthenticationRepository _authRepository = AuthenticationRepository();
  Future<void> signInWithGoogle() async {
    try {
      final userCredential = await _authRepository.signInWithGoogle();
      if (userCredential != null) {
        Get.offNamed('/home'); // Or replace with the appropriate route
      }
    } catch (error) {
      // Handle errors (e.g., show a Snackbar)
      Get.snackbar('Error', error.toString());
      print(error.toString());
    }
  }
}
