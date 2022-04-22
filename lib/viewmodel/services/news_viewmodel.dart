import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/news_model.dart';

class NewsViewModel extends GetxController {

  static String baseUrl = 'https://newsapi.org';
  static String myApiKey = '656195782efe42c4a6111ad1b2c0a00c';

  getData(String? category) async {
    final url = Uri.parse(
        '$baseUrl/v2/top-headlines?country=tr&category=$category&apiKey=$myApiKey'
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
  List<Articles> results = [];
  searchData(String? query) async {
    final url = Uri.parse(
        '$baseUrl/v2/everything/?q=$query&apiKey=$myApiKey'
    );
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {

      if(query != null){
        results = results.where((element) => element.title!.toLowerCase().contains(query.toLowerCase())).toList();
      }
      try {
        return NewsModel.fromJson(jsonDecode(response.body));
      }
      catch (e) {
        Get.snackbar('can not get any data', e.toString());
      }

    }
  }
}
