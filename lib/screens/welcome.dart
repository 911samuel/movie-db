import 'package:flutter/material.dart';
import 'package:medica_app/screens/top_doctors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Welcome(),
    );
  }
}

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Topdoctors()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.only(
      left: 24.0,
      right: 24.0,
      top: 32.0,
      bottom: 80.0,
    );

    return Scaffold(
      body: Container(
        margin: EdgeInsets.zero, // No margin
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/Group.png',
                width:
                    double.infinity, // Ensure the image takes up the full width
              ),
            ),
            const Padding(
              padding: padding, // Use the defined padding here
              child: Column(
                children: [
                  Text(
                    "Welcome to",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF246BFD), // Hex color #246BFD
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Medica! 👋",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF246BFD), // Hex color #246BFD
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32),
                  Text(
                    "The best online doctor appointment & consultation app of the century for your health and medical needs!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
