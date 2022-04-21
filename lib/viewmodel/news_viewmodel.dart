import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/news_model.dart';

class NewsViewModel extends GetxController {
  getData(String category) async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=tr&category=$category&apiKey=656195782efe42c4a6111ad1b2c0a00c'
    );
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return NewsModel.fromJson(jsonDecode(response.body));
      }
      catch (e) {
        Get.snackbar('can not get any data', e.toString());
      }
    }
  }
}
