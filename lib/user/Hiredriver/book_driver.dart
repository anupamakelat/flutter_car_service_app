// ignore_for_file: must_be_immutable, prefer_const_constructors, sort_child_properties_last, unused_element, deprecated_member_use
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:drive_buddy/admin/add_driver.dart';
import 'package:drive_buddy/database/addDriver/function.dart';
import 'package:drive_buddy/database/addDriver/model.dart';
import 'package:drive_buddy/user/Hiredriver/book_detail.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDriver extends StatefulWidget {
  DriverData drivedata;
  bool isbook;
  BookDriver({super.key, required this.drivedata, required this.isbook});
  @override
  State<BookDriver> createState() => _BookDriverState();
}

class _BookDriverState extends State<BookDriver> {
  

    Future<void> deletedriver(context, int? id) async {
    final remove = await Hive.openBox<DriverData>('addDetails');
    remove.delete(id);
    getdrivers();

    // Navigator.of(context)
    //     .pop(MaterialPageRoute(builder: (context) => ()));
  }

  void delete(context, int? id) {
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
                      deletedriver(context, id);
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
          actions: [
            PopupMenuButton(onSelected: (value) {
              if (value == 'delete') {
                delete(context, widget.drivedata.id);
              } else if (value == 'edit') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddDriver(
                              isEdit: true,
                              data: widget.drivedata,
                            )));
              }
            }, itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Delete'),
                  value: 'delete',
                ),
                PopupMenuItem(
                  child: Text('Edit'),
                  value: 'edit',
                )
              ];
            }),
          ],
          title: widget.isbook
              ? Text(
                  'Book your driver',
                  style: TextStyle(color: Colors.black),
                )
              : Text('Driver Details')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircleAvatar(
              radius: 90,
              backgroundImage:
                  FileImage(File(widget.drivedata.image.toString())),
              child: widget.drivedata.image == null
                  ? Icon(Icons.person, size: 60, color: Colors.white)
                  : null,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("  Driver Name:    ${widget.drivedata.name}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            leading: Icon(Icons.class_outlined),
            title: Row(
              children: [Text("  Driver Phone:" ,
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 140,
                    child:  TextButton(
                            onPressed: () {_launchPhone(widget.drivedata.contact);},
                            child: Text(" ${widget.drivedata.contact}",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w500)),
                          ),
                  )
                  ]
            ),
               
                         
          ),
          ListTile(
            leading: Icon(Icons.person_add_alt_rounded),
            title: Text("  Experience:       ${widget.drivedata.experience}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Row(
              children: [
                Text(' Description: ',
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
                SizedBox(
                  width: 210,
                  child: Text(" ${widget.drivedata.description}",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          widget.isbook
              ? InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookDetails(
                                  driver: widget.drivedata,
                                )));
                  },
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 16, 15, 13)),
                      ),
                    ),
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: const Color.fromARGB(255, 235, 228, 228),
                        borderRadius: BorderRadius.circular(9)),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
    void _launchPhone(number) async {
    final phoneNumber = number;
    if (await canLaunch('tel:$phoneNumber')) {
      await launch('tel:$phoneNumber');
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}


