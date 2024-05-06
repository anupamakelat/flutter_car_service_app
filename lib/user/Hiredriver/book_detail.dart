// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_local_variable, must_be_immutable
import 'package:flutter/material.dart';
import 'package:drive_buddy/common/widgets/snackBar.dart';
import 'package:drive_buddy/database/addDriver/model.dart';
import 'package:drive_buddy/database/bookDetails.dart/funtions.dart';
import 'package:drive_buddy/database/signup/model.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookDetails extends StatefulWidget {
  BookDetails({super.key, required this.driver});
  DriverData? driver;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  TextEditingController pickupController = TextEditingController();
  TimeOfDay? pickupTime;
  String? selectedestimatetym;
  List<String> estimatetym = ['2Hrs', '4Hrs', '6Hrs', '8Hrs', '10Hrs', '12Hrs'];

  TextEditingController _entryTimeController = TextEditingController();

  List<String> gear = ['Manual', 'Automatic'];
  String? selectedgear;
  String? seletedModel;
  List<String> model = ['HatchBack', 'Sedan,', 'SUV', 'Luxury'];

  Future<void> _selectTime(BuildContext context, bool isEntryTime) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != null) {
      setState(() {
        if (isEntryTime) {
          pickupTime = picked;
          _entryTimeController.text = picked.format(context);
        }
      });
    }
  }

  String? _validateTimes() {
    if (pickupTime != null) {
      final DateTime entryDateTime =
          DateTime(pickupTime!.hour, pickupTime!.minute);
    }
    return null;
  }

  SignupDetails? currentUser;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var userEmail = prefs.getString('currentUser');

    final useBox = await Hive.openBox<SignupDetails>('signup_db');

    
    currentUser = useBox.values.firstWhere(
      (user) => user.email == userEmail,
    );
    setState(() {});
    // print('this is the emil:${currentUser!.email},');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your details',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your pick up location',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              TextFormField(
                 onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
                controller: pickupController,
                decoration: InputDecoration(
                    hintText: 'Your pick up location',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0))),
                maxLines: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Text('Your Car Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
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
              Text('Select pickup time*',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: TextFormField(
                   onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
                  controller: _entryTimeController,
                  readOnly: true,
                  onTap: () => _selectTime(context, true),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    hintText: 'PickUp Time',
                    prefixIcon: Icon(Icons.access_time),
                    errorText: _validateTimes(),
                  ),
                ),
              ),
              Text('Estimate Hours*',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    hintText: 'estimate time',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0)),
                  ),
                  value: selectedestimatetym,
                  onChanged: (String? newValue) {
                    selectedestimatetym = newValue!;
                  },
                  items:
                      estimatetym.map<DropdownMenuItem<String>>((String value) {
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
                   
                    if (pickupController.text.isNotEmpty &&
                        _entryTimeController.text.isNotEmpty &&
                        selectedgear != null &&
                        seletedModel != null &&
                        selectedestimatetym != null) {
                      addReq(context,
                          pickup: pickupController.text,
                          gear: selectedgear,
                          model: seletedModel,
                          time: _entryTimeController.text,
                          estimatetym: selectedestimatetym,
                          data: widget.driver,
                          currentUser: currentUser);
                    }else{
                      showSnackbar(context, 'Enter the full details', Colors.red);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        Colors.black, // Change the text color to white
                    textStyle: TextStyle(fontSize: 20), // Increase the text size
                  ),
                  child: Text('Proceed'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
