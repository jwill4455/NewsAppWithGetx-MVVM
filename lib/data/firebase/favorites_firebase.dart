import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FavoritesFirebase{

  Future<void> addToFavorite(String title, String description, String url, String urlToImage) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("users-favourite-items");

    var favoriteRef = await _collectionRef.add({
      "title": title,
      "description": description,
      "url": url,
      "urlToImage": urlToImage,
    }).then((value) => print("Added to favorite"));

  }
}
