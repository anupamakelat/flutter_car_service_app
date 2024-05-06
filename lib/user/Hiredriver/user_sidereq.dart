// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:drive_buddy/database/bookDetails.dart/funtions.dart';
import 'package:drive_buddy/database/bookDetails.dart/model.dart';
import 'package:hive/hive.dart';

class ReqDetail extends StatefulWidget {
  ReqDetail({required this.requsts, super.key});
  DriverRequest? requsts;
  @override
  State<ReqDetail> createState() => _ReqDetailState();
}

class _ReqDetailState extends State<ReqDetail> {
   Future<void> deleteonroad(context, int? id) async {
   // print(id);
    final remove = await Hive.openBox<DriverRequest>('addRequest');
   // print(name);
    remove.delete(id);
  getRequest();
  setState(() {
    
  });

    
  }

  void delete1(context, int? id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete'),
            content: Text('Do you want to delete'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      deleteonroad(context,id );
                      Navigator.pop(context);
                       Navigator.pop(context);
                    });
                  },
                  child: Text('yes')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('no')),
            ],
          );
        });
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book driver'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircleAvatar(
              radius: 90,
              backgroundImage:
                  FileImage(File(widget.requsts!.image.toString())),
              child: widget.requsts!.image == null
                  ? Icon(Icons.person, size: 60, color: Colors.white)
                  : null,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("  Driver Name: ${widget.requsts!.name}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            leading: Icon(Icons.class_outlined),
            title: Text("  Driver Phone: ${widget.requsts!.phone}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            leading: Icon(Icons.person_add_alt_rounded),
            title: Text("  Pickup Details: ${widget.requsts!.pickuplocation}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text("  Pickup Time: ${widget.requsts!.pickuptime}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text("  Estimate time: ${widget.requsts!.estimatetime}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 70,
          ),
          InkWell(
            onTap: () {
              delete1(context, widget.requsts!.id);
            //  print(widget.requsts!.id);
            },
            child: Container(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 16, 15, 13)),
                ),
              ),
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: const Color.fromARGB(255, 235, 228, 228),
                  borderRadius: BorderRadius.circular(9)),
            ),
          ),
        ],
      ),
    );
  }
}