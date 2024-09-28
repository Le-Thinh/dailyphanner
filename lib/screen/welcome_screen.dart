import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 34, 62, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Welcome back!',
                style: GoogleFonts.raleway(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            Image.asset(
              'assets/images/daily_logo_2.png',
            ),
            SizedBox(
              width: Get.width * 0.4,
              height: Get.width * 0.12,
              child: ElevatedButton(
                style: const ButtonStyle(),
                onPressed: () {
                  // Get.to(() => const LoginScreen());
                  Get.toNamed('/login');
                },
                child: Text(
                  'Sign In',
                  style: GoogleFonts.raleway(
                    color: const Color.fromRGBO(34, 34, 62, 1),
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
