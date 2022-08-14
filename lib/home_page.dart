import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdpui9_instagram/all_pages.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
int currentIndex = 0;
var pages = [
  MainPage(),
  MainPage(),
  MainPage(),
  MainPage(),
  MainPage(),
];
bool isNightMode = true;
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: isNightMode ? Colors.black : Colors.white,
        title:  Text(
          'Instagram',
          style: TextStyle(color: isNightMode ? Colors.grey : Colors.black),
        ),
        systemOverlayStyle: isNightMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            setState(() {
              if (isNightMode == false ){
                isNightMode = true;
              } else {
                isNightMode = false;
              }
            });
          },
          icon:  Icon(
            Icons.camera_alt_outlined,
            color: isNightMode ? Colors.grey : Colors.black,
          ),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.live_tv,
          //     color: Colors.black,
          //   ),
          // ),
          IconButton(
            onPressed: () {},
            icon:  Icon(
              Icons.favorite_border,
              color: isNightMode ? Colors.grey : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon:  Icon(
              Icons.send,
              color: isNightMode ? Colors.grey : Colors.black,
            ),
          ),
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
          primaryColor: Colors.blue,
          textTheme: Theme.of(context).textTheme.copyWith(caption: TextStyle(color: Colors.yellow,),),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap: (newIndex){
            setState(() {
              currentIndex = newIndex;
            });
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              label: 'home',
              icon: Icon(Icons.home_filled,),
            ),
            BottomNavigationBarItem(
              label: 'search',
              icon: Icon(Icons.search,),
            ),
            BottomNavigationBarItem(
              label: 'feed',
              icon: Icon(Icons.add_box_outlined,),
            ),
            BottomNavigationBarItem(
              label: 'likes',
              icon: Icon(Icons.shopping_bag_outlined,),
            ),
            BottomNavigationBarItem(
              label: 'profile',
              icon: Icon(Icons.person_outline,),
            ),
          ],
        ),
      ),
    );
  }
}
