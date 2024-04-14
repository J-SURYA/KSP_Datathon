// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DATA ANALYTICS'),
        ),
        body: const MyDashboard(),
      ),
    );
  }
}

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  final DatabaseReference _nitroReference =
      FirebaseDatabase.instance.reference().child('values').child('brake');
  final DatabaseReference _accReference = FirebaseDatabase.instance
      .reference()
      .child('values')
      .child('acceleration');
  final DatabaseReference _suddenReference = FirebaseDatabase.instance
      .reference()
      .child('values')
      .child('suddenbrake');
  final DatabaseReference _cornerReference =
      FirebaseDatabase.instance.reference().child('values').child('cornering');
  final DatabaseReference _rightReference =
      FirebaseDatabase.instance.reference().child('values').child('rightin');
  final DatabaseReference _leftReference =
      FirebaseDatabase.instance.reference().child('values').child('leftin');
  final DatabaseReference _lightReference =
      FirebaseDatabase.instance.reference().child('values').child('headlight');
  late double brvalue;
  late double accvalue;
  late double sudden;
  late double cornering;
  late double rightin;
  late double leftin;
  late double light;
  double count1 = 0;
  double count2 = 0;
  double count3 = 0;
  double count4 = 0;
  double count5 = 0;
  double count6 = 0;
  double count7 = 0;
  double count8 = 0;
  double count9 = 0;
  double count10 = 0;
  double count11 = 0;
  double count12 = 0;

  final StreamController<void> _updateController = StreamController<void>();

  @override
  void initState() {
    super.initState();
    brvalue = 0;
    accvalue = 0;
    sudden = 0;
    cornering = 0;
    rightin = 0;
    leftin = 0;
    light = 0;
    _nitroReference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          brvalue = (event.snapshot.value as num).toDouble();
          _updateCounts();
        });
      }
    });
    _accReference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          accvalue = (event.snapshot.value as num).toDouble();
          _updateCounts();
        });
      }
    });
    _suddenReference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          sudden = (event.snapshot.value as num).toDouble();
          _updateCounts();
        });
      }
    });
    _cornerReference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          cornering = (event.snapshot.value as num).toDouble();
          _updateCounts();
        });
      }
    });
    _rightReference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          rightin = (event.snapshot.value as num).toDouble();
          _updateCounts();
        });
      }
    });
    _leftReference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          leftin = (event.snapshot.value as num).toDouble();
          _updateCounts();
        });
      }
    });
    _lightReference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          light = (event.snapshot.value as num).toDouble();
          _updateCounts();
        });
      }
    });
  }

  void _updateCounts() {
    count1 = brvalue == 0 ? count1 + 1 : count1;
    count2 = brvalue == 1 ? count2 + 1 : count2;
    count3 = brvalue == 2 ? count3 + 1 : count3;
    count4 = accvalue == 0 ? count4 + 1 : count4;
    count5 = accvalue == 1 ? count5 + 1 : count5;
    count6 = accvalue == 2 ? count6 + 1 : count6;
    count7 = brvalue != 3 ? count7 + 1 : count7;
    count8 = sudden == 1 ? count8 + 1 : count8;
    count9 = cornering == 1 ? count9 + 1 : count9;
    count10 = rightin == 1 ? count10 + 1 : count10;
    count11 = leftin == 1 ? count11 + 1 : count11;
    count12 = light == 1 ? count12 + 1 : count12;
    _updateController.add(null);
  }

  List<Map<String, double>> get dataMaps {
    // Dynamically set count1, count2, count3 for the first pie chart
    return [
      {
        'low': count1,
        'medium': count2,
        'high': count3,
      },
      {
        'low': count4,
        'medium': count5,
        'high': count6,
      },
      {
        'brake': count7,
        'suddenbrake': count8,
        'cornering': count9,
      },
      {
        'rightindicator': count10,
        'leftindicator': count11,
        'headlight': count12,
      },
    ];
  }

  final List<List<Color>> colorLists = [
    [Colors.blue, Colors.green, Colors.red],
    [Colors.yellow, Colors.orange, Colors.purple],
    [Colors.yellow, Colors.orange, Colors.purple],
    [Colors.blue, Colors.green, Colors.red],
  ];

  final List<List<String>> centerTexts = [
    ['Brake System'],
    ['Acceleration'],
    ['Controls'],
    ['Indicators'],
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(
          dataMaps.length,
          (index) => Container(
            margin: const EdgeInsets.all(16),
            child: PieChart(
              dataMap: dataMaps[index],
              animationDuration: const Duration(milliseconds: 800),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 10,
              colorList: colorLists[index],
              initialAngleInDegree: 0,
              chartType: ChartType.disc,
              ringStrokeWidth: 32,
              centerText: centerTexts[index].first,
              legendOptions: const LegendOptions(
                showLegends: true,
                legendPosition: LegendPosition.right,
                showLegendsInRow: false,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: const ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: true,
                decimalPlaces: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
