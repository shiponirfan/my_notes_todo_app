import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes_todo_app/routes/routes_name.dart';
import 'package:my_notes_todo_app/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(
        seconds: 3,
      ),
      () {
        Get.offAllNamed(RoutesName.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 200,
            ),
            Text(
              'My Notes',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: AppColors.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
