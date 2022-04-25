import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_mvvm/viewmodel/services/news_viewmodel.dart';

import '../../model/article_model.dart';
import '../details.dart';


class Sports extends GetWidget<NewsViewModel> {
  @override
  final controller = Get.put(NewsViewModel());

  Sports({Key? key}) : super(key: key);

    List<NewsModel> listData=[];


    Future<void> getDataApi() async {
     listData= (await controller.getData('sports'))!;

    }

  @override
  Widget build(BuildContext context) {


      return FutureBuilder(
            future: getDataApi(),
            builder: (context, AsyncSnapshot snapshot) {
             NewsModel? data = snapshot.data;
              if (listData.isNotEmpty) {
                return ListView.builder(
                    itemCount: listData.length,
                    itemBuilder: (context, index)  {
                      final model = listData[index];

                      return InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsDetail(
                                  articles: model.articles![index]
                                )
                            )
                        );
                      },

                        child: Column(
                      children: [
                          Image.network(
                            model.articles![index].urlToImage.toString(),
                            fit: BoxFit.fill,
                          ),
                          Text(
                            model.articles![index].title.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            model.articles![index].description.toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                        ],
                      ),
                      );
                    }
                    );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
      );
  }
}
