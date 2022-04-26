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
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users-favourite-items");

    return _collectionRef.add({
      "title": widget.articles.title,
      "description": widget.articles.description,
      "url": widget.articles.url,
      "urlToImage": widget.articles.urlToImage,
    }).then((value) => print("Added to favorite"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.articles.title.toString()),
        actions: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users-favourite-items")
                .where("title", isEqualTo: widget.articles.title)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Text("");
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: IconButton(
                  onPressed: () => snapshot.data.docs.length == 0
                      ? addToFavorite()
                      :print("Already Added"),
                  icon: snapshot.data.docs.length == 0
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                ),
              );
            },
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
