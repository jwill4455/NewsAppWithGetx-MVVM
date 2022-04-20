import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_mvvm/viewmodel/news_viewmodel.dart';

import '../model/news_model.dart';

class HomeView extends StatefulWidget {

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put(NewsViewModel());

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (val){
          setState(() {
            _currentIndex = val;
          });

        },
        items: const [
          BottomNavigationBarItem(
            label: 'Sports',
              icon: Icon(Icons.sports_football)
          ),
          BottomNavigationBarItem(
              label: 'Science',
              icon: Icon(Icons.science)
          ),
          BottomNavigationBarItem(
              label: 'Health',
              icon: Icon(Icons.health_and_safety)
          )
        ],
      ),
      body: FutureBuilder(
          future: controller.getData(),
          builder: (context, AsyncSnapshot snapshot) {
            NewsModel? data = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: data!.articles!.length,
                  itemBuilder: (context, index) {
                    return Column(
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
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
