import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/article_model.dart';



class NewsDetail extends StatefulWidget {

  final Article articles;

  NewsDetail({required this.articles});

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {

  Future addToFavorite() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("users-favourite-items");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.articles.title.toString()),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ), onPressed: () {

            },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.network(
            widget.articles.urlToImage.toString(),
            fit: BoxFit.fill,
          ),
          Text(
            widget.articles.description.toString(),
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

