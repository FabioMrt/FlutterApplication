import 'package:flutter/material.dart';
// import 'package:flutter_application_1/components/coustom_bottom_nav_bar.dart';
import 'package:flutter_application_1/theme.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
