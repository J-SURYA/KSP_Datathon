// ignore_for_file: deprecated_member_use
import 'dart:async';

import 'package:cockpitintelligence/components/car_indicators.dart';
import 'package:cockpitintelligence/components/gear_battery.dart';
import 'package:cockpitintelligence/components/time_and_temp.dart';
import 'package:cockpitintelligence/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  final DatabaseReference _seatbeltreference =
      FirebaseDatabase.instance.reference().child('values').child('belt');
  final DatabaseReference _batreference =
      FirebaseDatabase.instance.reference().child('values').child('battery');
  final DatabaseReference _earreference =
      FirebaseDatabase.instance.reference().child('values').child('ear');
  final DatabaseReference _steerreference =
      FirebaseDatabase.instance.reference().child('values').child('steering');
  final DatabaseReference _hornreference =
      FirebaseDatabase.instance.reference().child('values').child('horn');
  final DatabaseReference _suddenreference = FirebaseDatabase.instance
      .reference()
      .child('values')
      .child('suddenbrake');
  final DatabaseReference _parkreference =
      FirebaseDatabase.instance.reference().child('values').child('parklight');
  late bool seatbeltindicator;
  late bool batteryindicator;
  late bool earindicator;
  late bool steerindicator;
  late bool hornindicator;
  late bool suddenindicator;
  late bool parkindicator;
  late int batteryp;
  late Timer? _parkblinkTimer;
  bool _parkImageVisible = false;
  late double ear;
  late String eyeImageAssetPath;
  @override
  void initState() {
    super.initState();
    seatbeltindicator = false;
    batteryindicator = false;
    earindicator = false;
    steerindicator = false;
    hornindicator = false;
    suddenindicator = false;
    parkindicator = false;
    ear = 0.0;
    eyeImageAssetPath = "assets/eye2.png";
    batteryp = 0;
    _seatbeltreference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          int seatbelt = event.snapshot.value as int;
          seatbeltindicator = seatbelt == 1;
        });
      }
    });
    _batreference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          int battery = event.snapshot.value as int;
          batteryp = battery;
        });
      }
    });
    _earreference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          ear = event.snapshot.value as double;
          _updateEyeImageAsset();
        });
      }
    });
    _steerreference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          int handlebar = event.snapshot.value as int;
          steerindicator = handlebar == 1;
        });
      }
    });
    _hornreference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          int horn = event.snapshot.value as int;
          hornindicator = horn == 1;
        });
      }
    });
    _suddenreference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          int sudden = event.snapshot.value as int;
          suddenindicator = sudden == 1;
        });
      }
    });
    _parkreference.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          int park = event.snapshot.value as int;
          parkindicator = park == 1;
          if (parkindicator) {
            _startParkBlinking();
          } else {
            _stopParkBlinking();
          }
        });
      }
    });
  }

  void _startParkBlinking() {
    _parkblinkTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _parkImageVisible = !_parkImageVisible;
        });
      } else {
        // If the widget is not mounted, cancel the timer to prevent further updates.
        _stopParkBlinking();
      }
    });
  }

  void _stopParkBlinking() {
    if (_parkblinkTimer != null && _parkblinkTimer!.isActive) {
      _parkblinkTimer!.cancel();
    }
    _parkblinkTimer = null;
    if (mounted) {
      setState(() {
        _parkImageVisible = true;
      });
    }
  }

  Future<void> _updateEyeImageAsset() async {
    eyeImageAssetPath = await _getEyeImageAsset();
  }

  Future<String> _getEyeImageAsset() async {
    if (ear <= 0.2) {
      eyeColor = yellow;
      return "assets/eye2.png";
    } else {
      eyeColor = red;
      return "assets/eye3.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double aspectRatio = screenWidth / screenHeight;
    if (aspectRatio < 1.3) {
      aspectRatio = 1.39;
    } else if (aspectRatio < 2) {
      aspectRatio = 2.09;
    } else if (aspectRatio < 2.35) {
      aspectRatio = 2.43;
    } else {
      aspectRatio = 2.65;
    }

    bool batteryindicator = batteryp <= 20;
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                    vertical: screenHeight * 0.02),
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 80,
                    maxHeight: 604,
                  ),
                  alignment: Alignment.center,
                  child: AspectRatio(
                    aspectRatio: aspectRatio,
                    child: LayoutBuilder(
                      builder: (context, constraints) => CustomPaint(
                        painter: PathPainter(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimeAndTemp(constraints: constraints),
                            Expanded(
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: screenHeight * 0.03),
                                      const SpecificCarIndicators(),
                                      SizedBox(
                                        height: screenHeight * 0.07,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: screenHeight * 0.25,
                                              width: screenWidth * 0.15,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: screenWidth * 0.05),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    _parkImageVisible
                                                        ? Image.asset(
                                                            'assets/park.png',
                                                            height:
                                                                screenHeight *
                                                                    0.05,
                                                            width: screenWidth *
                                                                0.05,
                                                            color: parkindicator
                                                                ? green
                                                                : indicatorColor,
                                                          )
                                                        : Container(),
                                                    const Spacer(),
                                                    Image.asset(
                                                        'assets/low_battery.png',
                                                        height:
                                                            screenHeight * 0.05,
                                                        width:
                                                            screenWidth * 0.05,
                                                        color: batteryindicator
                                                            ? red
                                                            : indicatorTrueColor),
                                                    SizedBox(
                                                      height:
                                                          screenHeight * 0.01,
                                                    ),
                                                    Text(
                                                        '${batteryp.toStringAsFixed(1)} %',
                                                        style: TextStyle(
                                                            fontSize:
                                                                screenWidth *
                                                                    0.015,
                                                            color: white)),
                                                    SizedBox(
                                                      height:
                                                          screenHeight * 0.02,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Image.asset(
                                                    "assets/seat_belt.png",
                                                    height: screenHeight * 0.20,
                                                    width: screenWidth * 0.20,
                                                    color: seatbeltindicator
                                                        ? indicatorTrueColor
                                                        : indicatorColor,
                                                  ),
                                                  Image.asset(
                                                    eyeImageAssetPath,
                                                    height: screenHeight * 0.14,
                                                    width: screenWidth * 0.11,
                                                    color: eyeColor,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Image.asset(
                                                    "assets/steering_wheel.png",
                                                    height: screenHeight * 0.20,
                                                    width: screenWidth * 0.20,
                                                    color: steerindicator
                                                        ? indicatorTrueColor
                                                        : primaryColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: screenHeight * 0.2,
                                              width: screenWidth * 0.15,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: screenWidth * 0.05),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Image.asset(
                                                      'assets/horn.png',
                                                      height:
                                                          screenHeight * 0.05,
                                                      width: screenWidth * 0.05,
                                                      color: hornindicator
                                                          ? green
                                                          : indicatorColor,
                                                    ),
                                                    Image.asset(
                                                        'assets/sudden_brake.png',
                                                        height:
                                                            screenHeight * 0.08,
                                                        width:
                                                            screenWidth * 0.08,
                                                        color: suddenindicator
                                                            ? red
                                                            : indicatorColor)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      GearAndBattery(constraints: constraints),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.bottomRight,
        colors: [primaryColor, primaryColor],
      ).createShader(const Offset(0, 0) & size)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0.h;

    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width * 0.13, size.height * 0.05);
    path.lineTo(size.width * 0.31, 0);
    path.lineTo(size.width * 0.39, size.height * 0.11);
    path.lineTo(size.width * 0.60, size.height * 0.11);
    path.lineTo(size.width * 0.69, 0);
    path.lineTo(size.width * 0.87, size.height * 0.05);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width * 0.87, size.height);
    path.lineTo(size.width * 0.13, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class GearPrinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 32, 146, 0)
      ..style = PaintingStyle.fill;

    double strokeWidth = 0.35.h;
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width * 0.08, size.height * 0.5);
    path.lineTo(size.width * 0.34, size.height * 0.5);
    path.lineTo(size.width * 0.42, 0);
    path.lineTo(size.width * 0.48, 0);
    path.lineTo(size.width * 0.48, strokeWidth);
    path.lineTo(size.width * 0.42, strokeWidth);
    path.lineTo(size.width * 0.34, size.height * 0.5 + strokeWidth);
    path.lineTo(size.width * 0.11, size.height * 0.5 + strokeWidth);
    path.close();
    canvas.drawPath(path, paint);

    Path path2 = Path();
    path2.moveTo(size.width * 0.52, 0);
    path2.lineTo(size.width * 0.58, 0);
    path2.lineTo(size.width * 0.66, size.height * 0.5);
    path2.lineTo(size.width * 0.90, size.height * 0.5);
    path2.lineTo(size.width, size.height);
    path2.lineTo(size.width * 0.87, size.height * 0.5 + strokeWidth);
    path2.lineTo(size.width * 0.66, size.height * 0.5 + strokeWidth);
    path2.lineTo(size.width * 0.58, strokeWidth);
    path2.lineTo(size.width * 0.52, strokeWidth);

    path2.close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
