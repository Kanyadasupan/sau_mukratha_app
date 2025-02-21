import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            Image.asset(
              'assets/images/saulogo.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 60),
            Text(
              'Tech SAU BUFFET',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
            SizedBox(height: 20),
            Text(
              'แอปพลิเคชั่นร้านหมูกระทะ\nเพื่อคนไทย\nโดยเด็กไทย\nสนใจแอปพลิเคชั่นติดต่อ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(height: 2),
            Text(
              'เด็กไอที SAU',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _makePhoneCall('0616345824');
              },
              child: Image.asset(
                'assets/images/sauqr.png',
                width: 100,
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
