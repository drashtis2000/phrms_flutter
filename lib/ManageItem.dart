import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phrms/services/firebase_services.dart';

class ManageItemScreen extends StatefulWidget {
  static const String id = "Manage-Item-Screen";

  @override
  State<ManageItemScreen> createState() => _ManageItemScreenState();
}

class _ManageItemScreenState extends State<ManageItemScreen> {
  final _formkey = GlobalKey<FormState>();
  FirebaseServices _services = FirebaseServices();
  String dropdownValue = '';
  late QuerySnapshot querySnapshot;

  Widget _dropDownButton(){
    return DropdownButton<String>(
      value: dropdownValue,
      hint: Text("Select Category : "),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: querySnapshot.docs.map((e) {
        print("DropdownMenuItem value: ${e['Name']}");
        return DropdownMenuItem<String>(
          value: e['Name'],
          child: Text(e["Name"]),
        );
      }).toList(),
    );
  }

  getCategoryList(){
    return _services.categories.get().then((QuerySnapshot qs) {
      setState(() {
        querySnapshot = qs;
      });
    });
  }
  @override
  void initState() {
    dropdownValue = '';
    getCategoryList();
    // TODO: implement initState
    super.initState();
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
            Text('Add Items : ',
              style: TextStyle(color: Colors.red, fontSize: 27),
            ),
            _dropDownButton(),
          ],
        ),
      ),
    );
  }
}