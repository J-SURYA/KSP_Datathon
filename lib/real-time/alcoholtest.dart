import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:firebase_database/firebase_database.dart';

class alcoholtest extends StatefulWidget {
  const alcoholtest({super.key});

  @override
  State<alcoholtest> createState() => _alocoholState();
}

class _alocoholState extends State<alcoholtest> {
  final DatabaseReference _accReference =
      FirebaseDatabase.instance.reference().child('values').child('alcohol');
  late double accvalue;
  double acccount = 0;
  double acccount1 = 0;
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
      "stable": acccount,
      "drunk": acccount1,
    };
  }

  void _updateCounts() {
    acccount = accvalue == 0 ? acccount + 1 : acccount;
    acccount1 = accvalue == 1 ? acccount1 + 1 : acccount1;

    // Update dataMap whenever counts change
    setState(() {
      dataMap = {
        "stable": acccount,
        "drunk": acccount1,
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
                  'ALCOHOL ANALYSIS',
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
            Colors.green,
            Colors.yellow,
          ],
          initialAngleInDegree: 0,
          chartType: ChartType.disc,
          ringStrokeWidth: 32,
          centerText: "ALCOHOL DETECTION SYSTEM",
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
