import 'package:cockpitintelligence/static/locationofaccident.dart';
import 'package:cockpitintelligence/static/pedestrian.dart';
import 'package:cockpitintelligence/static/road_type.dart';
import 'package:cockpitintelligence/static/victim.dart';
import 'package:cockpitintelligence/static/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyHomePage_1 extends StatefulWidget {
  const MyHomePage_1({super.key});

  @override
  State<MyHomePage_1> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: Text('STATE DATA ANALYTICS!',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  subtitle: Text('YOU CAN REALIZE',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white54)),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/image1.png'),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(200))),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const LocationAccident()),
                      );
                    },
                    child: itemDashboard('LOCATION',
                        CupertinoIcons.play_rectangle, Colors.deepOrange),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Victim()),
                      );
                    },
                    child: itemDashboard('VICTIM ANALYSIS',
                        CupertinoIcons.graph_circle, Colors.green),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Pedestrian()),
                      );
                    },
                    child: itemDashboard(
                        'time period', CupertinoIcons.person_2, Colors.purple),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => const Road()),
                      );
                    },
                    child: itemDashboard('ROAD Type',
                        CupertinoIcons.chat_bubble_2, Colors.brown),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Weather()),
                      );
                    },
                    child: itemDashboard('WEATHER',
                        CupertinoIcons.money_dollar_circle, Colors.indigo),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const LocationAccident()),
                      );
                    },
                    child: itemDashboard(
                        'CAUSE', CupertinoIcons.add_circled, Colors.teal),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  itemDashboard(String title, IconData iconData, Color background) => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: Colors.white)),
            const SizedBox(height: 8),
            Text(title.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      );
}
