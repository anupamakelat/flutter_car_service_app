import 'package:flutter/material.dart';
import 'package:drive_buddy/admin/reqest.dart';
import 'package:drive_buddy/user/driver_accepted.dart';
import 'package:drive_buddy/user/driver_rejected.dart';
import 'package:google_fonts/google_fonts.dart';

class Drification extends StatefulWidget {
  const Drification({super.key});

  @override
  State<Drification> createState() => _DrificationState();
}

class _DrificationState extends State<Drification> {
  @override
  Widget build(BuildContext context) {
    return   DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Driver Request',
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w500, color: Colors.black, fontSize: 22),
          ),
          centerTitle: true,
          bottom: TabBar(isScrollable: true,
              tabs: const [
                Tab(
                  text: ' Request',
                ),
                Tab(
                  text:' Accepted' ,
                ),
               
                Tab(
                  text: 'Rejected',
                ),
                
                
              ],
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.black,
              indicatorWeight: 3,
              labelStyle: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        body: const TabBarView(
          children:  [
           RequestPage(),
          DriverAccepted (),
          DriverRejected(),

          ],
          
        ),
        
      ),
    );
  }
}