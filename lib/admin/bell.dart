// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:drive_buddy/admin/onroad_request.dart';
import 'package:drive_buddy/user/page_accepted.dart';
import 'package:drive_buddy/user/page_rejected.dart';
import 'package:google_fonts/google_fonts.dart';

class Bellfication extends StatefulWidget {
  const Bellfication({super.key});

  @override
  State<Bellfication> createState() => _BellficationState();
}

class _BellficationState extends State<Bellfication> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'On Road Request',
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
        body: TabBarView(
          children:  const [
          UsRequest(),
          AcceptPage (),
          RejectedPage(),

          ],
          
        ),
        
      ),
    );
  }
}