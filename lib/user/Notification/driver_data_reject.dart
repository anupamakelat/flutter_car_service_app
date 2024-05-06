// ignore_for_file: prefer_const_constructors, deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:drive_buddy/database/rejectDriver/model.dart';
import 'package:url_launcher/url_launcher.dart';

class RejectDriData extends StatefulWidget {
   RejectDriData({required this.requests, super.key});
   RejectDriver?requests;

  @override
  State<RejectDriData> createState() => _RejectDriDataState();
}

class _RejectDriDataState extends State<RejectDriData> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 13, right: 13),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Driver name       : ${widget.requests!.name}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Driver num          : ${widget.requests!.phone}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Vehicle model    : ${widget.requests!.model}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Gear                     :  ${widget.requests!.gear}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Pickup time        :  ${widget.requests!.pickuptime}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Pickup address  :  ${widget.requests!.pickuplocation}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Username           :  ${widget.requests!.username}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text('UserPhone',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 30,
                          ),
                          TextButton(
                            onPressed: () {_launchPhone(widget.requests!.userphn);},
                            child: Text(" ${widget.requests!.userphn}",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text("Estimatetym       :  ${widget.requests!.estimatetime}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 0, 0, 0))),
                               SizedBox(
                        height: 35,
                      ),
                     
                         
                         
                        ],
                      )
                    ],
                  ),
                ],
              )
            
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