import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users-favourite-items")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something is wrong"),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data?.docs.length ?? 0,
              itemBuilder: (_, index) {
                DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];
                return Card(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: ListTile(
                          leading: Text(
                              _documentSnapshot["title"]
                          ),
                        ),
                      ),

                       Expanded(
                         flex: 1,
                         child: ListTile(
                            trailing: GestureDetector(
                              child: const CircleAvatar(
                                child:  Icon(Icons.remove_circle),
                              ),
                              onTap: (){
                                FirebaseFirestore.instance.collection("users-favourite-items").doc(_documentSnapshot.id).delete();
                              },
                            ),
                      ),
                       ),
                    ],
                  ),
                );
              }
              );
        },
      )),
    );
  }
}
