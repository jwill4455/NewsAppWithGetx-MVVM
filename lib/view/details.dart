import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_mvvm/extensions/constants.dart';
import '../data/firebase/favorites_firebase.dart';
import '../data/model/article_model.dart';

class NewsDetail extends StatefulWidget {
  final Article articles;

  NewsDetail({required this.articles});

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {

  final FavoritesFirebase _favorites = Get.put(FavoritesFirebase());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.articles.title.toString()),
        actions: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(Constants.collectionName)
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
                      ? _favorites.addToFavorite(
                      widget.articles.title.toString(),
                      widget.articles.description.toString(),
                      widget.articles.url.toString(),
                      widget.articles.urlToImage.toString(),
                  )
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
