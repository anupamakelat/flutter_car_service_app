// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:drive_buddy/database/onRoadBook/model.dart';

class ServiceDetails extends StatefulWidget {
   ServiceDetails({ required this.requsts, super.key});
OnRoadData?requsts;
  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text("  Location: ${widget.requsts!.yourlocation}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("  Land Mark: ${widget.requsts!.landmark}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),
           ListTile(
            leading: Icon(Icons.person_add_alt_rounded),
            title: Text("  Gear: ${widget.requsts!.gear}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text("  Model: ${widget.requsts!.model}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),

          ListTile(
            leading: Icon(Icons.description),
            title: Text("  Registration No: ${widget.requsts!.registration_no}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ), ListTile(
            leading: Icon(Icons.description),
            title: Text("  Contact Detail: ${widget.requsts!.contact}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ), ListTile(
            leading: Icon(Icons.description),
            title: Text("  Problem: ${widget.requsts!.problem}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ), 
          SizedBox(height: 70,),

          InkWell(
            onTap: (){
            
            },
            child: Container(child:Align(
               alignment: Alignment.center,
            child: Text('Cancel',style:
             TextStyle( fontSize: 18,
              color: Color.fromARGB(255, 16, 15, 13)), ),
          ) ,
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: const Color.fromARGB(255, 235, 228, 228),
                borderRadius: BorderRadius.circular(9)
              
              ),
            ),
          ) , 
        ],
        ),
    
    );
  }
}