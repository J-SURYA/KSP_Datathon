import 'package:cockpitintelligence/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:cockpitintelligence/ui/controllers/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(5)),
          child: Container(
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: AppBar(
              title: const Text(
                "PROFILE",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 10,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            color: const Color.fromARGB(
                255, 255, 255, 255), // Change the color as needed
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/profile.png'), // Replace with your image asset
                  ),
                ],
              ),
            ),
          ),
          buildProfileRow(
              Icons.person, 'Username', userName ??= "No user name"),
          buildProfileRow(Icons.email, 'E-mail', userEmail ??= "No user email"),
          buildProfileRow(Icons.electric_bike, 'Vehicle no.',
              userVehicle ??= "No vehicle number"),
          buildProfileRow(
              Icons.phone, 'Phone no.', userPhone ??= "No phone number"),
          const SizedBox(height: 10),
          OutlinedButton(
              onPressed: () {
                AuthService.logout();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text("Logout"))
        ],
      ),
    );
  }

  Widget buildProfileRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
