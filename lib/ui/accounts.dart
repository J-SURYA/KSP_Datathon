import 'package:cockpitintelligence/userhomepage.dart';
import 'package:flutter/material.dart';
import 'package:cockpitintelligence/ui/controllers/auth_service.dart';
import 'package:cockpitintelligence/ui/pages/login_page.dart';

class CheckUserLoggedInOrNot extends StatefulWidget {
  const CheckUserLoggedInOrNot({super.key});

  @override
  State<CheckUserLoggedInOrNot> createState() => _CheckUserLoggedInOrNotState();
}

class _CheckUserLoggedInOrNotState extends State<CheckUserLoggedInOrNot> {
  @override
  void initState() {
    AuthService.isLoggedIn().then((value) {
      if (value) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const UserHomepage()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
