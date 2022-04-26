import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_mvvm/viewmodel/services/news_viewmodel.dart';
import '../../firebase/favorites_firebase.dart';
import '../../model/article_model.dart';
import '../details.dart';

class Sports extends GetWidget<NewsViewModel> {

  Sports({Key? key}) : super(key: key);

  @override
  final controller = Get.find();

  final FavoritesFirebase _favorites = Get.put(FavoritesFirebase());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getData('sports'),
      builder: (context, AsyncSnapshot snapshot) {
        NewsModel? data = snapshot.data;
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: data!.articles!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NewsDetail(articles: data.articles![index])));
                  },
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Column(
                          children: [
                            Image.network(
                              data.articles![index].urlToImage.toString(),
                              fit: BoxFit.fill,
                            ),
                            Text(
                              data.articles![index].title.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data.articles![index].description.toString(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                          .collection("user-favourite-items")
                          .where("title", isEqualTo: data.articles![index].title)
                          .snapshots(),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.data == null) {
                              return const Text("");
                            }
                          return Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () => snapshot.data!.docs.isEmpty
                                  ? _favorites.addToFavorite(
                                data.articles![index].title.toString(),
                                data.articles![index].description.toString(),
                                data.articles![index].url.toString(),
                                data.articles![index].urlToImage.toString(),
                              )
                                  :print("Already Added"),
                              icon: snapshot.data!.docs.isEmpty
                                  ? const Icon(
                                Icons.favorite,
                                color: Colors.yellow,
                              )
                                  : const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
