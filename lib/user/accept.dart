// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:drive_buddy/database/accept/model.dart';

class AcceptDetails extends StatefulWidget {
   AcceptDetails({required this.requests, super.key});
  AcceptData?requests;

  @override
  State<AcceptDetails> createState() => _AcceptDetailsState();
}

class _AcceptDetailsState extends State<AcceptDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Accept Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text("  Location: ${widget.requests!.yourlocation}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("  Land Mark: ${widget.requests!.landmark}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),
           ListTile(
            leading: Icon(Icons.person_add_alt_rounded),
            title: Text("  Gear: ${widget.requests!.gear}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text("  Model: ${widget.requests!.model}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),

          ListTile(
            leading: Icon(Icons.description),
            title: Text("  Registration No: ${widget.requests!.registration_no}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ), ListTile(
            leading: Icon(Icons.description),
            title: Text("  Contact Detail: ${widget.requests!.contact}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ), ListTile(
            leading: Icon(Icons.description),
            title: Text("  Problem: ${widget.requests!.problem}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ), 
          SizedBox(height: 70,),

         
        ],
        ),
    
    );
  }
}