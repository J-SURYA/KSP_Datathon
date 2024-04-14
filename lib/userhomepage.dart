// ignore_for_file: library_private_types_in_public_api, file_names
import 'package:cockpitintelligence/demo.dart';
import 'package:cockpitintelligence/home.dart';
import 'package:cockpitintelligence/main_1.dart';
import 'package:cockpitintelligence/ui/user.dart';
import 'package:flutter/material.dart';

class UserHomepage extends StatefulWidget {
  const UserHomepage({Key? key}) : super(key: key);

  @override
  _UserHomepageState createState() => _UserHomepageState();
}

class _UserHomepageState extends State<UserHomepage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  void _navigatorBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    MyWidget(),
    const Navigate(),
    const MyApp_5(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 0,
              blurRadius: 20,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigatorBottomBar,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: "Analytics",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "User Account",
            ),
          ],
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle:
              const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
