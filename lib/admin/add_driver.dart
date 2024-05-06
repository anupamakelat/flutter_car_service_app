// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable, no_leading_underscores_for_local_identifiers
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:drive_buddy/admin/driver.dart';
import 'package:drive_buddy/common/signup.dart';
import 'package:drive_buddy/common/widgets/snackBar.dart';
import 'package:drive_buddy/common/widgets/validations.dart';
import 'package:drive_buddy/database/addDriver/function.dart';
import 'package:drive_buddy/database/addDriver/model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddDriver extends StatefulWidget {
  AddDriver({super.key, this.data, required this.isEdit});
  DriverData? data;
  bool isEdit;
  @override
  State<AddDriver> createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  final expeContoller = TextEditingController();
  final ageController = TextEditingController();
  final driverNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final phoneController = TextEditingController();
  // final namController=TextEditingController();
  File? selectImage;
  final _formkey = GlobalKey<FormState>();
  Driver? edit;

  @override
  Widget build(BuildContext context) {
    if (widget.isEdit) {
      phoneController.text = widget.data!.contact.toString();
      selectImage = File(widget.data!.image!);
      driverNameController.text = widget.data!.name.toString();
      descriptionController.text = widget.data!.description.toString();
      expeContoller.text = widget.data!.experience.toString();
    }
    return Scaffold(
        appBar: AppBar(
          title: widget.isEdit ? Text('Edit') : Text('Data Entry📝'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _selectImage();
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(border: Border.all()),
                          height: 150,
                          width: 150,
                          child: selectImage != null
                              ? Image.file(selectImage!, fit: BoxFit.fill)
                              : Icon(Icons.person))),
                  SizedBox(height: 20),
                  TextFormField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    maxLength: 16,
                    validator: validations.nameValidator,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: driverNameController,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                        prefixIcon: Icon(Icons.abc),
                        label: Text(
                          'Driver Name',
                          style: GoogleFonts.inter(color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    controller: phoneController,
                    validator: validations.validatePhone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(25),
                        prefixIcon: Icon(Icons.phone),
                        label: Text(
                          'Contact',
                          style: GoogleFonts.inter(color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    validator: validations.validateEmpty,
                    controller: expeContoller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(25),
                        prefixIcon: Icon(Icons.add_to_drive),
                        label: Text(
                          'Experience',
                          style: GoogleFonts.inter(color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    validator: validations.decValidator,
                    controller: descriptionController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    maxLines: 5,
                    decoration: InputDecoration(
                        label: Text(
                          'Description',
                          style: GoogleFonts.inter(color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      widget.isEdit
                          ? editdriver(
                              context,
                              widget.data!.id,
                              driverNameController.text,
                              selectImage!.path,
                              int.parse(expeContoller.text),
                              descriptionController.text,
                              int.parse(phoneController.text))
                          : update();
                    },
                    child: Container(
                      height: 35,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Update',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 227, 225, 219)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  //to validate number
  String? validateNumber(String? value) {
    final trimmedValue = value?.trim();
    if (trimmedValue == null || trimmedValue.isEmpty) {
      return 'Mobile number is required';
    }

    final RegExp numberRegExp = RegExp(r'^[0-9]{10}$');
    if (!numberRegExp.hasMatch(trimmedValue)) {
      return 'Mobile number must be exactly 10 digits and contain only numbers';
    }
    return null;
  }

  void _selectImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectImage = File(image.path);
      });
    }
  }

  Future<void> update() async {
    final name = driverNameController.text.trim();
    final contact = phoneController.text.trim();
    final description = descriptionController.text.trim();
    final exp = expeContoller.text.trim();
    if (_formkey.currentState!.validate() && selectImage != null) {
      final _addvalue = DriverData(
          id: -1,
          image: selectImage!.path,
          name: name,
          contact: int.parse(contact),
          experience: int.parse(exp),
          description: description);
      addDetails(_addvalue);
      showSnackbar(context, 'Succesfull', Colors.green);
      nameController.clear();
      Navigator.pop(context);
    }
  }
}
