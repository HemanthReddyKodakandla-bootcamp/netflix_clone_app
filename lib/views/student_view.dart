import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'add_student_view.dart';

// ignore: must_be_immutable
class HomePageWidget extends StatelessWidget {
  HomePageWidget({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  CollectionReference students = FirebaseFirestore.instance.collection('students');

  final Stream<QuerySnapshot> _students =
      FirebaseFirestore.instance.collection('students').snapshots(includeMetadataChanges: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _students,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Text("Loading"));
                }

                return ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    DocumentSnapshot doc = document;
                    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
                    return ListTile(
                      title: Text(
                        data['first_name'],
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        data['last_name'],
                        style: const TextStyle(color: Colors.white),
                      ),
                      leading: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddStudent(
                                firstname: data['first_name'],
                                lastname: data['last_name'],
                                id: doc.id,
                              ),
                            ),
                          );
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          students.doc(doc.id).delete().then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              backgroundColor: Colors.blue,
                              duration: Duration(seconds: 1),
                              content: Text("Student deleted successfully"),
                            ));
                          }).catchError((error) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              backgroundColor: Colors.blue,
                              duration: Duration(seconds: 1),
                              content: Text("Something went wrong"),
                            ));
                          });
                        },
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text("Add Student"),
              onPressed: () {
                Navigator.pushNamed(context, "/addStudent");
              },
            ),
          )
        ],
      ),
    );
  }
}
