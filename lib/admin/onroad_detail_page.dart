// ignore_for_file: unnecessary_const, prefer_const_constructors, must_be_immutable, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:drive_buddy/common/widgets/snackBar.dart';
import 'package:drive_buddy/database/accept/function.dart';
import 'package:drive_buddy/database/accept/model.dart';
import 'package:drive_buddy/database/onRoadBook/functions.dart';
import 'package:drive_buddy/database/onRoadBook/model.dart';
import 'package:drive_buddy/database/reject/function.dart';
import 'package:drive_buddy/database/reject/model.dart';
import 'package:hive/hive.dart';

class OnRoadPage extends StatefulWidget {
  OnRoadData? datas;

  OnRoadPage({super.key, this.datas});

  @override
  State<OnRoadPage> createState() => _OnRoadPageState();
}


class _OnRoadPageState extends State<OnRoadPage> {

  //late ValueNotifier inflist1;
  

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
                        "Your Location     : ${widget.datas?.yourlocation}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Land Mark           : ${widget.datas?.landmark}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text("Vehicle model    : ${widget.datas?.model}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 16,
                      ),
                      Text("Gear                      :  ${widget.datas?.gear}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                          "Registration No  :  ${widget.datas?.registration_no}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 16,
                      ),
                      Text("User Contact       :  ${widget.datas?.contact}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 16,
                      ),
                      Text("Problem               :  ${widget.datas?.problem}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: ()async {
                             
                              final _addvalue = AcceptData(
                                  contact: widget.datas!.contact,
                                  gear: widget.datas!.gear,
                                  landmark: widget.datas!.landmark,
                                  model: widget.datas!.model,
                                  problem: widget.datas!.problem,
                                  registration_no:
                                      widget.datas!.registration_no,
                                  yourlocation: widget.datas!.yourlocation,
                                  id: widget.datas!.id);
                              addaccept(_addvalue);
                              showSnackbar(context, 'Succesfull', Colors.green);
                              //nameController.clear();
                             
                            await  dele(context, widget.datas!.id);
                              // ignore: use_build_context_synchronously
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
                                child: Text(
                                  'Accept',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 12, 12, 12)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          InkWell(
                            onTap: () {
                              final _addvalue = RejectData(
                                  contact: widget.datas!.contact,
                                  gear: widget.datas!.gear,
                                  landmark: widget.datas!.landmark,
                                  model: widget.datas!.model,
                                  problem: widget.datas!.problem,
                                  registration_no:
                                      widget.datas!.registration_no,
                                  yourlocation: widget.datas!.yourlocation,
                                  id: widget.datas!.id);
                              addreject(_addvalue);
                              showSnackbar(context, 'Succesfull',
                                  Color.fromARGB(255, 190, 37, 10));
                             
                                dele(context, widget.datas!.id);
                              // ignore: use_build_context_synchronously
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
                                child: Text(
                                  'Reject',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 12, 12, 12)),
                                ),
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
}

Future<void> deleteasp(context, int ? id) async {
  final remove = await Hive.openBox<AcceptData>('accept');
  remove.delete(id);
  getasp();

  // Navigator.of(context)
  //     .pop(MaterialPageRoute(builder: (context) => ()));
}
