import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cockpitintelligence/userhomepage.dart';
import 'package:cockpitintelligence/ui/controllers/auth_service.dart';
import 'package:telephony/telephony.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final Telephony telephony = Telephony.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _vehicleController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  void listenToIncomingSMS(BuildContext context) {
    print("Listening to sms.");
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        // Handle message
        print("sms received : ${message.body}");
        // verify if we are reading the correct sms or not

        if (message.body!.contains("excelsync-8d4a2")) {
          String otpCode = message.body!.substring(0, 6);
          setState(() {
            _otpController.text = otpCode;
            // wait for 1 sec and then press handle submit
            Future.delayed(const Duration(seconds: 1), () {
              handleSubmit(context);
            });
          });
        }
      },
      listenInBackground: false,
    );
  }

  // handle after otp is submitted
  void handleSubmit(BuildContext context) {
    if (_formKey1.currentState!.validate()) {
      AuthService.loginWithOtp(otp: _otpController.text).then((value) {
        if (value == "Success") {
          // Store user details in Firestore
          storeUserDetails();
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const UserHomepage()),
          );
        } else {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                value,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      });
    }
  }

  // Function to store user details in Firestore
  void storeUserDetails() {
    String vehicleNumber = _vehicleController.text;
    FirebaseFirestore.instance
        .collection('users')
        .doc(vehicleNumber)
        .set({
          'name': _nameController.text,
          'email': _emailController.text,
          'PoliceRegisterNumber': vehicleNumber,
          'phone': _phoneController.text,
        })
        .then((value) => print("User details added to Firestore"))
        .catchError((error) => print("Failed to add user details: $error"));
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Center(
                        child: Text(
                          "REGISTER ",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: "Name",
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your name";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your email";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              controller: _vehicleController,
                              decoration: InputDecoration(
                                labelText: "Vehicle Number",
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your vehicle";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                prefixText: "+91 ",
                                labelText: "Enter your phone number",
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                              validator: (value) {
                                if (value!.length != 10) {
                                  return "Invalid phone number";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              AuthService.sentOtp(
                                phone: _phoneController.text,
                                errorStep: () =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Error in sending OTP",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                                nextStep: () {
                                  // start listening for otp
                                  listenToIncomingSMS(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text("OTP Verification"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Enter 6 digit OTP"),
                                          const SizedBox(height: 12),
                                          Form(
                                            key: _formKey1,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: _otpController,
                                              decoration: InputDecoration(
                                                labelText:
                                                    "Enter your phone number",
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(32),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value!.length != 6) {
                                                  return "Invalid OTP";
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              handleSubmit(context),
                                          child: const Text("Submit"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("Send OTP"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
