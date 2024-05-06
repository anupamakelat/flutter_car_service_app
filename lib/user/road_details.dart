// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:drive_buddy/common/widgets/snackBar.dart';
import 'package:drive_buddy/database/onRoadBook/functions.dart';
import 'package:drive_buddy/database/onRoadBook/model.dart';

class Road extends StatefulWidget {
  const Road({super.key});

  @override
  State<Road> createState() => _RoadState();
}

class _RoadState extends State<Road> {
  final formKeyss = GlobalKey<FormState>();
  final yourlocation = TextEditingController();
  final landmark = TextEditingController();
  final contact = TextEditingController();
  final problem = TextEditingController();
  final registration = TextEditingController();
  String? selectedgear;
  String? seletedModel;
  String? selectedProblem;
  List<String> gear = ['Manual', 'Automatic'];
  List<String> model = ['HatchBack', 'Sedan,', 'SUV', 'Luxury'];
  List<String> services = [
    'Petrol',
    'Disel',
    'Tyre Punture',
    'Car Breakdown',
    'Oil Leak',
    'Starting Trouble',
    'others'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Your details',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKeyss,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Your pickup location',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              TextFormField(
                 onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
                  controller: yourlocation,
                  decoration: InputDecoration(
                      hintText: 'Your location',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0))),
                  maxLines: 1),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                 onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
                controller: landmark,
                decoration: InputDecoration(
                    hintText: 'Road name,Area,Colony(Required)',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0))),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Your Car Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      hintText: 'Gear', border: OutlineInputBorder()
                      
                      ),
                
                  value: selectedgear,
                  onChanged: (String? newValue) {
                    selectedgear = newValue!;
                  },
                  items: gear.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      hintText: 'Model', border: OutlineInputBorder()
                      // filled: true,
                      //fillColor: Colors.greenAccent,
                      ),
                  //  dropdownColor: const Color.fromARGB(255, 171, 185, 178),
                  value: seletedModel,
                  onChanged: (String? newValue) {
                    seletedModel = newValue!;
                  },
                  items: model.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                ),
              ),
              TextFormField( onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
                controller: registration,
                decoration: InputDecoration(
                    hintText: 'Registration number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your contact no:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              TextFormField( onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
                controller: contact,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'contact no',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Select your problem:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      hintText: 'Problem', border: OutlineInputBorder()
                      // filled: true,
                      //fillColor: Colors.greenAccent,
                      ),
                  //  dropdownColor: const Color.fromARGB(255, 171, 185, 178),
                  value: selectedProblem,
                  onChanged: (String? newValue) {
                    selectedProblem = newValue!;
                  },
                  items: services.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    addinfo();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('Proceed'),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  void addinfo() {
    if (yourlocation.text.isNotEmpty &&
        landmark.text.isNotEmpty &&
        contact.text.isNotEmpty &&
       selectedProblem!.isNotEmpty &&
        registration.text.isNotEmpty) {
      addData();
  
    } else {
      showSnackbar(
          context, 'Fill all details', Color.fromARGB(255, 238, 16, 39));
    }
  }

  void addData() {
    final addd = OnRoadData(
        yourlocation: yourlocation.text.trim(),
        landmark: landmark.text.trim(),
        gear: selectedgear,
        model: seletedModel,
        registration_no: registration.text.trim(),
        contact: contact.text.trim(),
        problem: selectedProblem);
    addinformation(addd);
    showSnackbar(context, 'Succesfull', Colors.green);
    Navigator.pop(context);
  }
}
