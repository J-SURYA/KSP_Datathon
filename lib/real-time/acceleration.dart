import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class accSystemPage extends StatefulWidget {
  const accSystemPage({Key? key}) : super(key: key);

  @override
  State<accSystemPage> createState() => _accSystemPageState();
}

class _accSystemPageState extends State<accSystemPage> {
  final DatabaseReference _accReference = FirebaseDatabase.instance
      .reference()
      .child('values')
      .child('acceleration');
  late double accvalue;
  double acccount = 0;
  double acccount1 = 0;
  double acccount2 = 0;
  late Map<String, double> dataMap; // Declare dataMap as a late variable

  @override
  void initState() {
    super.initState();
    accvalue = 0;
    _accReference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          accvalue = (event.snapshot.value as num).toDouble();
          _updateCounts();
        });
      }
    });

    // Initialize dataMap here
    dataMap = {
      "low": acccount,
      "medium": acccount1,
      "high": acccount2,
    };
  }

  void _updateCounts() {
    acccount = accvalue == 0 ? acccount + 1 : acccount;
    acccount1 = accvalue == 1 ? acccount1 + 1 : acccount1;
    acccount2 = accvalue == 2 ? acccount2 + 1 : acccount2;

    // Update dataMap whenever counts change
    setState(() {
      dataMap = {
        "low": acccount,
        "medium": acccount1,
        "high": acccount2,
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
          centerText: "BRAKE SYSTEM",
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
