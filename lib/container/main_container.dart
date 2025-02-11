import 'package:flutter/material.dart';
import 'package:flutter_provider_app/utils/resources/styles.dart';

import '../home/home_screen.dart';
import '../settings/settings_screen.dart';
import '../utils/widgets/text_widget.dart';
import '../utils/resources/strings.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key, required this.title});

  final String title;

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int currentIndex = 0;

  List<Widget> widgetList = const [
    CText(Strings.home, style: TextStyles.textHeadingStyle),
    CText(Strings.settings, style: TextStyles.textHeadingStyle),
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
            label: Strings.home,
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: Strings.settings,
              backgroundColor: Colors.green),
        ],
      ),
    );
  }
}
