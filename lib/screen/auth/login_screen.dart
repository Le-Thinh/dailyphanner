import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = Get.width;
    final controller = AuthController();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 34, 62, 1),
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/daily_logo_2.png',
                    scale: 1,
                    height: 80,
                    width: 80,
                  ),
                  Text(
                    'Daily Planner',
                    style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/vietnam_flag.png',
                      scale: 1,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: TextField(
                      // controller: ,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 201, 196,
                                  196)), // Border khi không focus
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ), // Border khi focus
                        ),
                        hintText: "Email",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        obscureText: controller.obscure.value,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.key_sharp),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.obscure.value =
                                  !controller.obscure.value;
                              if (controller.obscure.value)
                                controller.icon.value = CupertinoIcons.eye_fill;
                              else
                                controller.icon.value =
                                    CupertinoIcons.eye_slash;
                            },
                            icon: Icon(controller.icon.value),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 201, 196,
                                    196)), // Border khi không focus
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ), // Border khi focus
                          ),
                          hintText: "Password",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: Get.width * 0.5,
              height: Get.width * 0.1,
              child: ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {
                  Get.toNamed('/home');
                },
                child: Text(
                  'Sign In',
                  style: GoogleFonts.raleway(
                    color: const Color.fromRGBO(34, 34, 62, 1),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: Get.width * 0.5,
              height: Get.width * 0.1,
              child: ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {
                  controller.signInWithGoogle();
                },
                child: Text(
                  'For Student',
                  style: GoogleFonts.raleway(
                    color: const Color.fromRGBO(34, 34, 62, 1),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
