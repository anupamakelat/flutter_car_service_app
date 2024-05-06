// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, library_private_types_in_public_api, must_be_immutable
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:drive_buddy/common/widgets/snackBar.dart';
import 'package:drive_buddy/database/addDocument/function.dart';
import 'package:drive_buddy/database/addDocument/model.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
class AddDocumentPage extends StatefulWidget {
  bool isEdit;
  Document? data;
  AddDocumentPage({Key? key, required this.isEdit, this.data})
      : super(key: key);

  @override
  _AddDocumentPageState createState() => _AddDocumentPageState();
}

class _AddDocumentPageState extends State<AddDocumentPage> {
  @override
  void initState() {
    super.initState();

    getdr();
  }

  String _filePath = '';
  // PDFDocument? _pdfDocument;
  Future<void> _pickPDFFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        _filePath = result.files.single.path!;
        setState(() {});
      }
    } catch (e) {
      throw Exception("Error while picking the file: $e");
    }
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _expirationDateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
   
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
    if (widget.data != null) {
      _nameController.text = widget.data!.name!;
      _expirationDateController.text = widget.data!.expirationDate!;
      _filePath = widget.data!.pdf!;
    }
    return Scaffold(
      appBar: AppBar(
          title: widget.isEdit == false
              ? Text('Add Document')
              : Text('Edit Document')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Document Name'),
            ),
            // TextFormField(
              
            //   decoration:
            //       InputDecoration(labelText: 'Expiration Date (YYYY-MM-DD)'),
            // ),
            SizedBox(height: 20,),
             InkWell(
              onTap: ()async{
                _selectDate(context);
              },
              child:Text(DateFormat('yyyy-MM-dd').format(selectedDate))
             ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  _pickPDFFile();
                },
                child: Text('Pick PDF File'),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: _filePath.isNotEmpty
                  ? SfPdfViewer.file(File(_filePath))
                  : Container(),
            ),
            InkWell(
              onTap: () {
                widget.isEdit
                    ? editdoc(
                        context: context,
                        expirationDate: _expirationDateController.text,
                        id: widget.data!.id,
                        name: _nameController.text,
                        pdf: _filePath)
                    : add();
              },
              child: Center(
                child: Container(
                  height: 35,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: widget.isEdit
                        ? Text(
                            'edit',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 227, 225, 219)),
                          )
                        : Text(
                            'Update',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 227, 225, 219)),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> add() async {
      final _addvalue = Document(
          id: -1,
          name: _nameController.text,
          expirationDate: DateFormat('yyyy-MM-dd').format(selectedDate),
          // addDetails(_addvalue);)
          pdf: _filePath);
      addDoc(_addvalue);
      showSnackbar(context, 'Succesfull', Colors.green);
      Navigator.pop(context);
    
  }
}

Future<void> editdoc(
    {context,
    int? id,
    String? name,
    String? pdf,
    String? expirationDate}) async {
  final editBox = await Hive.openBox<Document>('addDoc');
  final existingCategory = editBox.values.firstWhere((user) => user.id == id);
  existingCategory.name = name;
  existingCategory.pdf = pdf;
  existingCategory.expirationDate = expirationDate;
  await editBox.put(id,existingCategory);
  getdr();
  Navigator.pop(context);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Succuss'),
    backgroundColor: Colors.amber,
  ));
}
