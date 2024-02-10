import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List<Widget> body = const[
    Icon(Icons.home),
    Icon(Icons.camera_alt),
    Icon(Icons.settings),
    Icon(Icons.person),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  //to remove the debug line
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu, color: Color(0xFF8FE1B5), size: 34,),
          actions: [Icon(Icons.search, color: Color(0xFF8FE1B5), size: 34,)],
          backgroundColor: Colors.transparent,
          elevation: 0, // to remove the shadow

        ),
        extendBody: true, //the body content will extend below both the AppBar and the BottomNavigationBar
        body: Center(
          child:
            body[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF8FE1B5),
          selectedItemColor: Colors.black87, //change the text color when it's selected
          selectedFontSize: 14, // the size of the text will increase when it is selected from 12 to 14
          selectedLabelStyle: const TextStyle(
            // color: Colors.black, // not working: selectedItemColor more importance than the selectedLabelStyle
            letterSpacing: 0.3, //increase the letter spacing when it's selected from 0.0 to 0.3
            fontWeight: FontWeight.bold, // the text will be bold when it is selected
          ),
          iconSize: 32, //Size
          onTap: (int newIndex){
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_rounded, color: Colors.white),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white),
              label: 'Setting',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white),
              label: 'Profile',
            )
          ]

        ),
      ),
    );
  }

}

