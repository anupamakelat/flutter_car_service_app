// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, deprecated_member_use, use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:drive_buddy/common/widgets/snackBar.dart';
import 'package:drive_buddy/database/acceptDriver/function.dart';
import 'package:drive_buddy/database/acceptDriver/model.dart';
import 'package:drive_buddy/database/bookDetails.dart/funtions.dart';
import 'package:drive_buddy/database/bookDetails.dart/model.dart';
import 'package:drive_buddy/database/rejectDriver/functions.dart';
import 'package:drive_buddy/database/rejectDriver/model.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestDetails extends StatefulWidget {
  DriverRequest? datas;

  RequestDetails({required this.datas, super.key});

  @override
  State<RequestDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<RequestDetails> {
  bool? accept;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 6, 49, 83),
          centerTitle: true,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 241, 241, 241)),
          title: Text(
            "Booking Details",
            style: TextStyle(color: Colors.white),
          ),
        ),
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
                        "Driver name       : ${widget.datas!.name}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Driver num          : ${widget.datas!.phone}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Vehicle model    : ${widget.datas!.model}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Gear                     :  ${widget.datas!.gear}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Pickup time        :  ${widget.datas!.pickuptime}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Pickup address  :  ${widget.datas!.pickuplocation}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Username           :  ${widget.datas!.username}",
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
                            onPressed: () {_launchPhone(widget.datas!.userphn);},
                            child: Text(" ${widget.datas!.userphn}",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text("Estimatetym       :  ${widget.datas!.estimatetime}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 0, 0, 0))),
                               SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: ()async{
                              final _addvalues =AcceptDriver(
                                image: widget.datas!.image,
                               name: widget.datas!.name,
                               phone: widget.datas!.phone,
                               model: widget.datas!.model, 
                               gear: widget.datas!.gear,
                               pickuptime: widget.datas!.pickuptime,
                               pickuplocation: widget.datas!.pickuplocation,
                               username: widget.datas!.username,
                               userphn: widget.datas!.userphn,
                               estimatetime: widget.datas!.estimatetime,
                               id: widget.datas!.id         
                              );
                              
                              addRequests(_addvalues);
                              showSnackbar(context, 'Succesfull', Colors.green);
                            await deleteacp(context,widget.datas!.id);
                            Navigator.pop(context);
                            },
                            child: Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                               color: Color.fromARGB(255, 233, 228, 228),
                               border: Border.all(color: Colors.black),
                               borderRadius: BorderRadius.circular(9),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('Accept',
                                style: TextStyle(
                                  fontSize: 18,
                                  color:  Color.fromARGB(255, 12, 12, 12)
                                ),),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          InkWell(
                            onTap:(){
                              final _addvalue =RejectDriver(
                                 image:widget.datas!.image,
                                 name: widget.datas!.name,
                                 phone: widget.datas!.phone,
                                 model: widget.datas!.model, 
                                 gear: widget.datas!.gear,
                                 pickuptime: widget.datas!.pickuptime,
                                 pickuplocation: widget.datas!.pickuplocation,
                                 username: widget.datas!.username,
                                 userphn: widget.datas!.userphn,
                                 estimatetime: widget.datas!.estimatetime,
                                 id: widget.datas!.id 
                              );
                               addReques(_addvalue);
                              showSnackbar(context, 'Sucessfull',Colors.red);
                              deleteacp(context, widget.datas!.id);
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                color:  Color.fromARGB(255, 233, 228, 228),
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('Reject',
                                style: TextStyle(
                                  fontSize: 18,
                                  color:  Color.fromARGB(255, 12, 12, 12)
                                ),),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }   
  
  
   void _launchPhone(number) async {
    final phoneNumber = number;
    if (await canLaunch('tel:$phoneNumber')) {
      await launch('tel:$phoneNumber');
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  Future<void>deleteacp(context,int?id)async{
    final remove = await Hive.openBox<DriverRequest>('addRequest');
    remove.delete(id);
    getRequest();
  }
}
