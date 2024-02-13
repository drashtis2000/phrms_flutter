import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phrms/CategoryListWidget.dart';
import 'package:phrms/services/firebase_services.dart';

class ManageCategories extends StatefulWidget {
  static const String id = "Manage-Categories";

  @override
  State<ManageCategories> createState() => _ManageCategoriesState();
}

  class _ManageCategoriesState extends State<ManageCategories> {
  final _formkey = GlobalKey<FormState>();
  FirebaseServices _services = FirebaseServices();

  final TextEditingController _name = TextEditingController();

  dynamic image;
  late String fileName;

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        image = File(result.files.first.path!);
        fileName = result.files.first.name;
        print("Image Bytes Length: ${image?.length}");
      });
    } else {
      print("No File Selected!");
    }
  }
  clean(){
    setState(() {
      _name.clear();
      image = null;
    });
  }
  saveDataToFirebase()async {
    if (image != null) {
      Uint8List imageBytes = await image.readAsBytes();
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('Categoryimages/$fileName');
    EasyLoading.show(status: "Loading");
    try {
      await ref.putData(imageBytes);
      print('Image uploaded successfully');
      String downloadURL = await ref.getDownloadURL().then((value) {
        if(value.isNotEmpty){
          _services.saveCategory(
              data: {
                'Name' : _name.text,
                'Image' : value
              },
             reference: _services.categories,
            docName: _name.text,
          ).then((value) {
            EasyLoading.dismiss();
            clean();
          });
        }
        return value;
      });
    } on firebase_storage.FirebaseException catch (e) {
      print("Error uploading image: $e");
      print(e.toString());
      clean();
      EasyLoading.dismiss();
    }
  }else {
      print('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add Category : ',
              style: TextStyle(color: Colors.red, fontSize: 27),),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blueGrey, width: 2),
                    ),
                    child: InkWell(
                        onTap: () {
                          pickFile();
                        },
                        child: image == null ? Center(child: Icon(Icons.file_upload)) : Image.file(image, fit: BoxFit.cover,))),

                  SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        child: TextFormField(
                          controller: _name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Category Name:";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text("Enter Category Name:"),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      Row(
                        children: [
                          image == null ? Container() : TextButton(
                            onPressed: () {
                              if(_formkey.currentState!.validate()){
                                saveDataToFirebase();
                              }
                            },
                            child: Text("Save", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.red),
                            ),
                          ),
                          SizedBox(width: 10),
                          TextButton(
                            onPressed: () {
                              EasyLoading.dismiss();
                              clean();
                          },
                            child: Text("Cancel", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.red),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Divider(thickness: 4,color: Colors.red,),
            Text('All Category : ',
              style: TextStyle(color: Colors.red, fontSize: 27),
            ),
            CategoryListWidget(),
          ],
        ),
      ),
    );
  }
}
