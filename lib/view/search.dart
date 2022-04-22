  import 'package:flutter/material.dart';

import '../model/news_model.dart';
import '../viewmodel/services/news_viewmodel.dart';
import 'details.dart';

class SearchUser extends SearchDelegate{

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(icon: const Icon(Icons.close),
      onPressed: (){
        query = '';
    },
    )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(icon: const Icon(Icons.arrow_back_ios),
      onPressed: (){
         Navigator.pop(context);
      }
      );
  }

  final controller = (NewsViewModel());

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: controller.searchData(query),
      builder: (context, AsyncSnapshot snapshot) {
        NewsModel? data = snapshot.data;
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: data!.articles!.length,
              itemBuilder: (context, index)  {

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
              }
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
     return const Center(
       child: Text(
         'Search Users'
       ),
     );
  }
  
}