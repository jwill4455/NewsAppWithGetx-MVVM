import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_mvvm/viewmodel/services/news_viewmodel.dart';
import '../../data/firebase/favorites_firebase.dart';
import '../../data/model/article_model.dart';
import '../details.dart';
import 'package:news_app_flutter_mvvm/extensions/constants.dart';

class Health extends GetWidget<NewsViewModel> {

  Health({Key? key}) : super(key: key);

  @override
  final controller = Get.find();

  final FavoritesFirebase _favorites = Get.put(FavoritesFirebase());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getData('health'),
      builder: (context, AsyncSnapshot snapshot) {
        NewsModel? data = snapshot.data;
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: data!.articles!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.red,
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
                              loadingBuilder: (BuildContext context, Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.grey,
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
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

                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection(Constants.collectionName)
                              .where("title", isEqualTo: data.articles![index].title)
                              .snapshots(),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.data == null) {
                              return const Text("");
                            }
                            return Expanded(
                              flex: 1,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: IconButton(
                                  onPressed: () => snapshot.data.docs.length == 0
                                      ? _favorites.addToFavorite(
                                    data.articles![index].title.toString(),
                                    data.articles![index].description.toString(),
                                    data.articles![index].url.toString(),
                                    data.articles![index].urlToImage.toString(),
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
