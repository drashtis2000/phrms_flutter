import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phrms/services/firebase_services.dart';


class CategoryListWidget extends StatefulWidget {
  const CategoryListWidget({super.key});

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  @override
  Widget build(BuildContext context) {
    FirebaseServices _services = FirebaseServices();
    deleteCategory(id)async{
      _services.categories.doc(id).delete();
    }

    showMyDialog(title, message, context, id)async{
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context ){
            return AlertDialog(
              title: Center(child: Text(title),),
              content: Text(message),
              actions: <Widget>[
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                },
                    child: Text("Cancel")),
                TextButton(onPressed: (){
                  deleteCategory(id);
                  Navigator.of(context).pop();
                },
                    child: Text("Delete")),
              ],

            );
          });
    }

    Widget CategoryWidget(data){
      return Container(
        margin: EdgeInsets.all(1),
        width: 800,
        height: 800,
        child: Stack(
          children: <Widget> [
            Positioned(
                bottom: 0,
                top: 0,
                right: 0,
                left: 0,
                child: Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(data['Image']),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            )),
            Positioned(
              bottom: 2,
              left: 33,
              top: 30,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: (){
                    showMyDialog("Delete Category", "Are you sure ? ", context, data.id);
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    return StreamBuilder<QuerySnapshot>(
      stream: _services.categories.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.data?.size == 0){
          return Center(child: Text("No Category Added!"));
        }

        return GridView.builder(
          shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 5,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
            ),
            itemCount: snapshot.data?.size,
            itemBuilder: (context, index){
            var data = snapshot.data?.docs[index];
            return CategoryWidget(data);
            }
        );
      },
    );
  }
}
