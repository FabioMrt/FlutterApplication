import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile/profile_screen.dart';
import 'package:flutter_application_1/theme.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    //listar telas Home(),
    Text('Inicio'),
    Text('Buscar'),
    Text('Favoritos'),
    ProfileScreen(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: kPrimaryColor,
        selectedItemColor: kSecondaryColor,
        unselectedLabelStyle: TextStyle(color: kPrimaryColor),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Início"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: "Buscar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: "Favoritos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Perfil"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
