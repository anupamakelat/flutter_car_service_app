// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Moreinfo extends StatefulWidget {
  const Moreinfo({super.key});

  @override
  State<Moreinfo> createState() => _MoreinfoState();
}

class _MoreinfoState extends State<Moreinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'About Us',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:   NetworkImage(
                          'https://i.pinimg.com/564x/eb/7d/44/eb7d44fd7c2cbf7b335961e2278d7829.jpg'),
                      radius: 50,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Drive Buddy',
                      style: GoogleFonts.poppins(
                          fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      ' Your Ultimate Hiredriver and Service Platform',
                      style: GoogleFonts.rubik(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  ''' Welcome to "Driving Buddy," your go-to destination for a seamless and delightful service experience. "Drive Buddy" is a cutting-edge Flutter application that combines the convenience of service platform with the efficiency of a local Hive database. Discover the app, use the app with confidence, and enjoy a personalized journey tailored to your preferences.
        ''',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Experienced drivers available',
                      style: TextStyle(fontSize: 16),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Explore a vast services available. Stay updated with the latest coming service updates:",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16)),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      _launchTCURL();
                    },
                    child: Text('Privacy Policy')),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Version 1.0',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchTCURL() async {
    Uri url = Uri.parse(
        'https://www.termsfeed.com/live/7580bd1f-1af8-498c-8b79-5ad54503b516');
    if (await launchUrl(url)) {
      //dialer opened
    } else {
      SnackBar(content: Text("couldn't launch the page"));
    }
  }
}