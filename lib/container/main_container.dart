import 'package:flutter/material.dart';
import 'package:flutter_provider_app/home/home_screen.dart';
import 'package:flutter_provider_app/settings/settings_screen.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key, required this.title});

  final String title;

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int currentIndex = 0;

  List<Widget> widgetList = const [
    Text('Home', style: TextStyle(fontSize: 40)),
    Text('Settings', style: TextStyle(fontSize: 40)),
  ];

  List<Widget> screensList = [
    const HomeScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),

      /// todo    body: Center(child: widgetList[currentIndex]),
      /// todo    body: Center( child: screensList[currentIndex], ),
      ///
      /// todo How to save state of each screen on Bottom Navigation
      body: IndexedStack(
        index: currentIndex,
        children: screensList,
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        // showSelectedLabels: true,
        // showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.green),
        ],
      ),
    );
  }
}
