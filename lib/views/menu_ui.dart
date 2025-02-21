import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuUi extends StatefulWidget {
  const MenuUi({super.key});

  @override
  State<MenuUi> createState() => _MenuUiState();
}

class _MenuUiState extends State<MenuUi> {
  List<String> menushow = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png',
  ];

  List<String> branchShop = [
    'assets/images/shop1.png',
    'assets/images/shop2.png',
    'assets/images/shop3.png',
    'assets/images/shop4.png',
    'assets/images/shop5.png',
  ];

  List<String> shoplocation = [
    'https://www.google.co.th/maps/@13.7076534,100.3831081,846m',
    'https://www.google.co.th/maps/@13.7076429,100.3835051,846m',
    'https://www.google.co.th/maps/@13.7077368,100.3858225,846m',
    'https://www.google.co.th/maps/@13.7094149,100.3991262,846m',
    'https://www.google.co.th/maps/@13.7118427,100.407646,598m',
  ];

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 10),
            Text(
              'เมนูเด็ด',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 100,
              margin: EdgeInsets.only(left: 10, right: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: menushow.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        menushow[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'ร้านในเครือ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: branchShop.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 15,
                    ),
                    child: InkWell(
                      onTap: () {
                        _launchInBrowser(
                          Uri.parse(shoplocation[index]),
                        );
                      },
                      child: Image.asset(
                        branchShop[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
