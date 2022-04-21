import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_mvvm/viewmodel/news_viewmodel.dart';

import '../../model/news_model.dart';
import '../details.dart';

class Health extends GetWidget<NewsViewModel> {
  @override
  final controller = Get.put(NewsViewModel());

  Health({Key? key}) : super(key: key);

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
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsDetail(
                                    articles: data.articles![index]
                                )
                            )
                        );
                      },

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
                                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
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
