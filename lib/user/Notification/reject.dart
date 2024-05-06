// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:drive_buddy/database/reject/model.dart';

class RejectDetails extends StatefulWidget {
   RejectDetails({ required this.request,super.key});
  RejectData?request;

  @override
  State<RejectDetails> createState() => _RejectDetailsState();
}

class _RejectDetailsState extends State<RejectDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rejected Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text("  Location: ${widget.request!.yourlocation}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("  Land Mark: ${widget.request!.landmark}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),
           ListTile(
            leading: Icon(Icons.person_add_alt_rounded),
            title: Text("  Gear: ${widget.request!.gear}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text("  Model: ${widget.request!.model}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),

          ListTile(
            leading: Icon(Icons.description),
            title: Text("  Registration No: ${widget.request!.registration_no}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ), ListTile(
            leading: Icon(Icons.description),
            title: Text("  Contact Detail: ${widget.request!.contact}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ), ListTile(
            leading: Icon(Icons.description),
            title: Text("  Problem: ${widget.request!.problem}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ), 
          SizedBox(height: 70,),

         
        ],
        ),
    
    );
  }
}