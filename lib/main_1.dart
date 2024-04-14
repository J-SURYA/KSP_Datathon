import 'package:cockpitintelligence/real-time/list.dart';
import 'package:cockpitintelligence/static/list_1.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(const MyApp_5());
}

class MyApp_5 extends StatelessWidget {
  const MyApp_5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DataTableDemo(),
    );
  }
}

class DataTableDemo extends StatefulWidget {
  const DataTableDemo({Key? key}) : super(key: key);

  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  Map<String, dynamic>? _data = {};

  @override
  void initState() {
    super.initState();
    _database.child('values').onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        setState(() {
          _data = Map<String, dynamic>.from(
              snapshot.value as Map<dynamic, dynamic>);
        });
      }
    });
  }

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
            color: Theme.of(context).primaryColor,
            child: AppBar(
              title: const Text(
                'REAL-TIME DATA',
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'ANALYTICS SOURCES',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('REAL-TIME ANALYTICS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('KARNATAKA STATE ANALYTICS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage_1()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Accident causing parameter')),
            DataColumn(label: Text('Indications')),
          ],
          rows: _data!.entries.map((entry) {
            return DataRow(cells: [
              DataCell(Text(entry.key)),
              DataCell(Text(entry.value.toString())),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
