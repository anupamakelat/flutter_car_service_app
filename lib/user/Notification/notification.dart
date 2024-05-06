// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:drive_buddy/user/Notification/all_data_accept.dart';
import 'package:drive_buddy/user/Notification/all_data_rejected.dart';
import 'package:drive_buddy/user/Notification/my_request.dart';
import 'package:drive_buddy/user/Notification/my_service.dart';
import 'package:google_fonts/google_fonts.dart';

class MyNotification extends StatefulWidget {
  const MyNotification({super.key});

  @override
  State<MyNotification> createState() => _OrdersState();
}

class _OrdersState extends State<MyNotification> {

@override


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'My Order',
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
                  text:' Service' ,
                ),
               
                Tab(
                  text: 'Accepted',
                ),
                Tab(
                  text: 'Rejected',
                )
                
              ],
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.black,
              indicatorWeight: 3,
              labelStyle: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        body: TabBarView(
          children:  const [
          MyRequest(),
          MyService(),
         AllAccepted (),
          AllRejected(),

          ],
          
        ),
        
      ),
    );
  }
}