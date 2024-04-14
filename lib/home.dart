import 'package:cockpitintelligence/main_1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Karnataka Accident Data App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WidgetPage(),
    );
  }
}

class WidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(05)),
          child: Container(
            width: double.infinity,
            color: Colors.blue,
            child: AppBar(
              leading: Container(
                padding: const EdgeInsets.only(left: 10), // Adjust the padding
              ),
              title: Container(
                padding:
                    const EdgeInsets.only(top: 10), // Adjust the top padding
                child: const Text(
                  'HOME PAGE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 10,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'ABOUT THIS APP',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Welcome to the Karnataka State Accident Data App, your comprehensive platform for accessing up-to-date accident data and statistics across Karnataka. Our app aims to provide valuable insights into road safety and help stakeholders make informed decisions to improve driving and reduce accidents.',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            const SizedBox(height: 30.0),
            Image.asset(
              'assets/karnatakapolice.png', // Replace with your image path
              height: 350.0,
              width: 350.0,
            ),
            const SizedBox(height: 40.0),
            const Text(
              'Key Features:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40.0),
            const FeatureItem(
              title: 'Real-time Updates',
              description:
                  'Stay informed with the latest accident data as it happens.',
              image: 'assets/real_timedata.png', // Add image path
            ),
            const FeatureItem(
              title: 'Interactive Map',
              description: 'Explore accident locations, find where it happens.',
              image: 'assets/interactivemap.png', // Add image path
            ),
            const FeatureItem(
              title: 'Matlib Graph',
              description:
                  'An interactive graph for visualizing the accident data.',
              image: 'assets/matlib_graph.png', // Add image path
            ),
            const FeatureItem(
              title: 'Advanced Filters',
              description:
                  'Easily filter and search for specific data based on location, time, or severity.',
              image: 'assets/data_filter.png', // Add image path
            ),
            const FeatureItem(
              title: 'Statistical Analysis',
              description:
                  'Gain insights into accident trends and patterns through comprehensive statistical analysis tools.',
              image: 'assets/accident_data.png', // Add image path
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp_5()),
                );
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const FeatureItem({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          height: 350.0,
          width: 350.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20.0),
        Text(
          title,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20.0),
        Text(
          description,
          style: const TextStyle(fontSize: 15.0),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
