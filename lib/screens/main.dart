import 'package:alansab_wetland_app/screens/registration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'registration.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyBVEZJ_I9TNwivxF-7KVejXRzoEqPZuSoU',
        appId: '1:182335270449:android:23dc398b9e76e86ee9ef10',
        messagingSenderId: '182335270449',
        projectId: 'alansabwetlandapplication'
    )
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,  //to remove the debug line
        home: MainPage(),
    );
  }
}
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  double widthSize = 0.0;
  double heightSize = 0.0;
  @override
  Widget build(BuildContext context) {
    widthSize = MediaQuery.of(context).size.width;
    heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Color(0xFF46923c),
          child: ListView(),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFF46923c)),
          // leading: Icon(Icons.menu,color: Color(0xFF46923c),),
          // title: Text("Welcome User",style: TextStyle(color: Color(0xFF46923c)),),
          backgroundColor: Colors.transparent,
          elevation: 0, // to remove the shadow

        ),
      backgroundColor: Colors.white,
      extendBody: true, //the body content will extend below both the AppBar and the BottomNavigationBar
        body: Container(
          child: Column(
            children: [
              //1
              Row( // Text
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: heightSize*0.15,),
                  Text("Get to Know more about",style: TextStyle(fontWeight: FontWeight.bold, fontSize: widthSize*0.05),),
                ],
              ),
              //2
              SizedBox(height: heightSize*0.03,),
              Row( // The 2 box images
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: widthSize*0.9,
                    height: heightSize*0.24,
                    // color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container( // 1
                          width: widthSize*0.44,
                          height: heightSize*0.22,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Color(0xFF46923c),width: 1.3,)
                          ),
                        ),
                        Container( //2
                          width: widthSize*0.44,
                          height: heightSize*0.22,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Color(0xFF46923c),width: 1.3)
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //text --> wetland, birds
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: widthSize*0.9,
                    height: heightSize*0.06,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Text('Wetland',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: widthSize*0.05),),
                        ),
                        Center(
                          child: Text('Birds',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: widthSize*0.05),),
                        ),
                      ],
                    ),
                  )
                ],

              ),
              //3
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: widthSize*0.9,
                    height: heightSize*0.24,
                    // color: Colors.black87,
                    child: Center(
                      child: Container( // 1
                        width: widthSize*0.44,
                        height: heightSize*0.22,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Color(0xFF46923c),width: 1.3,)
                        ),
                      ),
                    ),),
                ],

              ),
              //text --> events
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: widthSize*0.9,
                    height: heightSize*0.06,
                    // color: Colors.brown,
                    child: Center(
                          child: Text('Events',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: widthSize*0.05),),
                        ),
                  )
                ],

              ),
            ],
          ),

            // body[_currentIndex], // to check the bottom bar

        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF46923c),
          unselectedItemColor: Colors.black87,
          selectedItemColor: Colors.black87, //change the text color when it's selected
          selectedFontSize: 14, // the size of the text will increase when it is selected from 12 to 14
          selectedLabelStyle: const TextStyle(
            // color: Colors.black, // not working: selectedItemColor more importance than the selectedLabelStyle
            letterSpacing: 0.3, //increase the letter spacing when it's selected from 0.0 to 0.3
            fontWeight: FontWeight.bold, // the text will be bold when it is selected
          ),
          onTap: (int newIndex){
            if (newIndex == 3) { // Check if the 'Profile' item is clicked
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
              tooltip: 'Go to Home', //it's will appears when the user long-presses the icon
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_rounded, color: Colors.white),
              label: 'Scan',
              tooltip: 'Scan QR code',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.not_interested_rounded, color: Colors.white),
              label: '????',
              tooltip: 'Show/Provide feedback',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white),
              label: 'Profile',
              tooltip: 'View Profile',
            )
          ]

        ),
      );

  }

}

