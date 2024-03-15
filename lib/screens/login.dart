import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'forgetPassword.dart';
import '../main.dart';
import 'registration.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Future signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
      // .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  int currentIndex = 3;
  double widthSize = 0.0;
  double heightSize = 0.0;
  bool secureText = true;
  @override
  Widget build(BuildContext context) {

    widthSize = MediaQuery.of(context).size.width;
    heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: heightSize*0.08,),
            //1 text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: heightSize*0.05),
                Text("Login to your account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: widthSize*0.055
                  ),),
              ],
            ),
            //2 image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/undraw_Access_account_re_8spm.png',
                  // width: widthSize,
                  height: heightSize*0.27,
                )
              ],
            ),
            // text user
            Container(
              // color: Colors.pink,
                padding: EdgeInsets.only(top:17,left: 40.0,bottom: 10,), // Add padding from the left side
                alignment: Alignment.centerLeft,
                child: Text('Username', style: TextStyle(fontWeight:FontWeight.bold,fontSize: widthSize*0.045,),
                )
            ),
            //Email
            SizedBox(
              width: widthSize*0.8,
              height: heightSize*0.065,
              child: TextField(
                controller: emailController,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: TextStyle(fontSize: 15),
                  contentPadding: EdgeInsets.only(left: 30),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF46923c)),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF46923c),width: 2.0,),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            SizedBox(height: heightSize*0.012),
            // text pass
            Container(
              // color: Colors.pink,
                padding: EdgeInsets.only(left: 40.0,bottom: 10,), // Add padding from the left side
                alignment: Alignment.centerLeft,
                child: Text('Password', style: TextStyle(fontWeight:FontWeight.bold,fontSize: widthSize*0.045,),
                )
            ),
            //Password
            SizedBox(
              width: widthSize*0.8,
              height: heightSize*0.065,
              child: TextField(
                controller: passwordController,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                    hintText: "Enter your password",
                    hintStyle: TextStyle(fontSize: 15),
                    contentPadding: EdgeInsets.only(left: 30),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF46923c)),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF46923c),width: 2.0,),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  suffixIcon: IconButton(
                    icon: Icon(secureText ? Icons.visibility:Icons.visibility_off,color: Color(0xFF46923c),size: widthSize*0.05,),
                    onPressed: (){
                      setState(() {
                        secureText = !secureText;
                      });
                    },
                  )
                ),
                obscureText: secureText,
              ),
            ),
            //Forget pass
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(right: 35,bottom: 15,),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ForgetPasswordPage()),);
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Color(0xFF054C94), // Make the text appear like a hyperlink
                  ),
                ),
              ),
            ),
            //Button
            Container(
              width: widthSize * 0.8,
              height: heightSize * 0.065,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF46923c)),
                borderRadius: BorderRadius.circular(50),
              ),
              child: ElevatedButton(
                onPressed: () {
                  //login functionality here
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Color(0xFF46923c), fontWeight: FontWeight.bold, fontSize: widthSize*0.058,),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // White background when it's not clicked
                  foregroundColor: Color(0xFF46923c), // White background when it's clicked
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            SizedBox(height: heightSize*0.012,),
            //Google
            Container(
              width: widthSize * 0.8,
              height: heightSize * 0.065,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF46923c)),
                borderRadius: BorderRadius.circular(50),
              ),
              child: ElevatedButton(
                onPressed: () {
                  //login functionality here
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/GIcon.png"),
                    Text(
                      'Login with Google',
                      style: TextStyle(color: Color(0xFF46923c), fontSize: widthSize*0.044,),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // White background when it's not clicked
                  foregroundColor: Color(0xFF46923c), // White background when it's clicked
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            SizedBox(height: heightSize*0.012,),
            //Don't have an account
            RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Sign up',
                    style: TextStyle(color: Color(0xFF054C94),fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (contaxt)=> RegisterPage()));
                      },
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
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
            if (newIndex == 0) { // Check if the 'Home' item is clicked
              Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName)); // Navigate back to the main page
              return;
            }
            setState(() {
              currentIndex = newIndex;
            });
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
              tooltip: 'Open Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white),
              label: '???',
              tooltip: 'View Settings',
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
