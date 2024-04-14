import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class indicators extends StatefulWidget {
  const indicators({super.key});

  @override
  State<indicators> createState() => _indicatorsState();
}

class _indicatorsState extends State<indicators> {
  final DatabaseReference _accReference =
      FirebaseDatabase.instance.reference().child('values').child('parklight');
  final DatabaseReference _indi1Reference =
      FirebaseDatabase.instance.reference().child('values').child('leftin');
  final DatabaseReference _indi2Reference =
      FirebaseDatabase.instance.reference().child('values').child('rightin');
  late double accvalue;
  late double leftvalue;
  late double rightvalue;
  double acccount = 0;
  double acccount1 = 0;
  double acccount2 = 0;
  late Map<String, double> dataMap; // Declare dataMap as a late variable

  @override
  void initState() {
    super.initState();
    accvalue = 0;
    leftvalue = 0;
    rightvalue = 0;
    _accReference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          accvalue = (event.snapshot.value as num).toDouble();
          _updateCounts();
        });
      }
    });
    _indi1Reference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          leftvalue = (event.snapshot.value as num).toDouble();
          _updateCounts();
        });
      }
    });
    _indi2Reference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          rightvalue = (event.snapshot.value as num).toDouble();
          _updateCounts();
        });
      }
    });

    // Initialize dataMap here
    dataMap = {
      "parking": acccount,
      "leftindicator": acccount1,
      "rightindicator": acccount2,
    };
  }

  void _updateCounts() {
    acccount = accvalue == 1 ? acccount + 1 : acccount;
    acccount1 = leftvalue == 1 ? acccount1 + 1 : acccount1;
    acccount2 = rightvalue == 1 ? acccount2 + 1 : acccount2;

    // Update dataMap whenever counts change
    setState(() {
      dataMap = {
        "parking": acccount,
        "leftindicator": acccount1,
        "rightindicator": acccount2,
      };
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
            color: Colors.blue,
            child: AppBar(
              leading: Container(
                padding: const EdgeInsets.only(left: 10), // Adjust the padding
              ),
              title: Container(
                padding:
                    const EdgeInsets.only(top: 10), // Adjust the top padding
                child: const Text(
                  'ACCELERATION ANALYSIS',
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
      body: Center(
        child: PieChart(
          dataMap: dataMap,
          animationDuration: const Duration(milliseconds: 800),
          chartLegendSpacing: 64,
          chartRadius: MediaQuery.of(context).size.width / 1.8,
          colorList: const [
            Colors.blue,
            Colors.red,
            Colors.green,
            Colors.yellow,
          ],
          initialAngleInDegree: 0,
          chartType: ChartType.disc,
          ringStrokeWidth: 32,
          centerText: "INDICATOR SYSTEM",
          legendOptions: const LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.bottom,
            showLegends: true,
            legendShape: BoxShape.circle,
            legendTextStyle: TextStyle(fontSize: 16),
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: true,
            showChartValuesOutside: false,
            decimalPlaces: 1,
          ),
        ),
      ),
    );
  }
}
