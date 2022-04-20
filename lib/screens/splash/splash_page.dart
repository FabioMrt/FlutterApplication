import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_initial.dart';
import 'package:flutter_application_1/utils/overlay.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final appInitial = Get.find<AppInitial>();

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () {
        appInitial.getAccess();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppOverlay(),
    );
  }
}
