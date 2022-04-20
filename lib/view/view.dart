import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_mvvm/viewmodel/news_viewmodel.dart';

import '../model/news_model.dart';

class HomeView extends GetWidget<NewsViewModel> {
  @override
  final controller = Get.put(NewsViewModel());

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getData(),
        builder: (context, AsyncSnapshot snapshot)
        {
          NewsModel? data = snapshot.data;
          return ListView.builder(
              itemCount: data!.articles!.length,
              itemBuilder: (context, index) {
                return Text(
                    data.articles![index].title.toString()
                  );
              }
              );
        }
        );
  }
}
