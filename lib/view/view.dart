import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_mvvm/view/bottom_navigation_bar/health.dart';
import 'package:news_app_flutter_mvvm/view/bottom_navigation_bar/sports.dart';
import 'package:news_app_flutter_mvvm/view/search.dart';
import 'package:news_app_flutter_mvvm/viewmodel/services/news_viewmodel.dart';

import 'bottom_navigation_bar/favorites.dart';
import 'bottom_navigation_bar/science.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put(NewsViewModel());

  int _currentIndex = 0;

  List<Widget> screens = [Sports(), Science(), Health(), Favorites()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text.rich(
              TextSpan(
                  children: [
                    TextSpan(
                      text: 'News', style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold, color: Colors.orange
                    ),
                    ),
                    TextSpan(
                      text: 'App', style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white
                    ),
                    )
                  ]
              )
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(icon: const Icon(Icons.search),
              onPressed: (){
                showSearch(context: context, delegate: SearchUser());
              }
              ),
            ),
          ],
          backgroundColor: Colors.black,
        ),


        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.orange,
          currentIndex: _currentIndex,
          onTap: (val) {
            setState(() {
              _currentIndex = val;
            });
          },
          items: const [
            BottomNavigationBarItem(
                label: 'Sports', icon: Icon(Icons.sports_basketball)
            ),
            BottomNavigationBarItem(
                label: 'Science', icon: Icon(Icons.science)
            ),
            BottomNavigationBarItem(
                label: 'Health', icon: Icon(Icons.health_and_safety)
            ),
            BottomNavigationBarItem(
                label: 'Favorites', icon: Icon(Icons.favorite)
            )
          ],
        ),
        body: screens[_currentIndex]);
  }
}
