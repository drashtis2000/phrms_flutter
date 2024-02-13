import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phrms/services/firebase_services.dart';

import 'AdminTimesheetApprovalPage.dart';

class DashBoardScreen extends StatelessWidget {
  static const String id = "DashBoard-Screen";
  final FirebaseServices _services = FirebaseServices();

  Widget adminApprovalButton(BuildContext context, String userRole) {
    // Check the user's role before allowing access
    if (userRole == "Admin") {
      return ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AdminTimesheetApprovalPage.id);
        },
        child: Text('Admin Timesheet Approval'),
      );
    } else {
      // Handle unauthorized access, e.g., show an error message or hide the button
      return SizedBox(); // Empty widget
    }
  }


  @override
  Widget build(BuildContext context) {
    Widget analyticWidget({required String title, required String value}){
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: 100,
          width: 155,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(value),
                    Icon(Icons.show_chart),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
    String userRole = "Admin";
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(70.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  StreamBuilder<QuerySnapshot>(
          stream: _services.users.snapshots(),
          builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                      height: 100,
                      width: 155,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: Center(child: CircularProgressIndicator(color: Colors.white,),)),
                );
              }
              if (snapshot.hasData){
                int totalUsers = snapshot.data!.docs.length;
                return analyticWidget(title: "Total users",value: totalUsers.toString());
              }
              return SizedBox();
          },
        ),
                  StreamBuilder<QuerySnapshot>(
                    stream: _services.categories.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Container(
                              height: 100,
                              width: 155,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                              ),
                              child: Center(child: CircularProgressIndicator(color: Colors.white,),)),
                        );
                      }
                      if (snapshot.hasData){
                        int totalUsers = snapshot.data!.docs.length;
                        return analyticWidget(title: "Category",value: totalUsers.toString());
                      }
                      return SizedBox();
                    },
                  ),
                  analyticWidget(title: "Total Items", value: "0"),
                  adminApprovalButton(context, userRole),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


