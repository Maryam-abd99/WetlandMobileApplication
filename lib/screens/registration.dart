import 'package:alansab_wetland_app/screens/login.dart';
import 'package:alansab_wetland_app/screens/termsAndCondition.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int currentIndex = 3;
  double widthSize = 0.0;
  double heightSize = 0.0;
  @override
  Widget build(BuildContext context) {
    bool secureText = true;
    bool agreedToTerms = false;
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    widthSize = MediaQuery.of(context).size.width;
    heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //1 text
            SizedBox(height: heightSize*0.08,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign up for a new account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: widthSize*0.055
                  ),),
                SizedBox(height: heightSize*0.009,),
                Text("Let's help you meet your task",
                  style: TextStyle(
                      letterSpacing: widthSize*0.0007,
                      color: Colors.grey[700],
                      fontSize: widthSize*0.04
                  ),),
              ],
            ),
            SizedBox(height: heightSize*0.04,),
            //text first and last name
            Container(
              height: heightSize*0.055,
              child: (
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          // color: Colors.pink,
                            padding: EdgeInsets.only(left: 39.0,), // Add padding from the left side
                            alignment: Alignment.centerLeft,
                            child: Text('First name', style: TextStyle(fontWeight:FontWeight.bold,fontSize: widthSize*0.045,),
                            )
                        ),
                      ),
                      SizedBox(width: widthSize*0.03,),
                      Expanded(
                        child: Container(
                          // color: Colors.pink,
                            padding: EdgeInsets.only(left: 10.0,), // Add padding from the left side
                            alignment: Alignment.centerLeft,
                            child: Text('Last name', style: TextStyle(fontWeight:FontWeight.bold,fontSize: widthSize*0.045,),
                            )
                        ),
                      ),
                    ],
                  )
              ),
            ),
            //first and last name
            Container(
              width: widthSize*0.8,
              height: heightSize*0.065,
              child: (
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
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
                        ),),
                    SizedBox(width: widthSize*0.03,),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
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
                      ),),
                  ],
                )
              ),
            ),
            // text email
            Container(
              // color: Colors.pink,
                padding: EdgeInsets.only(top:17,left: 40.0,bottom: 10,), // Add padding from the left side
                alignment: Alignment.centerLeft,
                child: Text('Email', style: TextStyle(fontWeight:FontWeight.bold,fontSize: widthSize*0.045,),
                )
            ),
            //Email
            Container(
              width: widthSize*0.8,
              height: heightSize*0.065,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  hintText: "Enter your email",
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
            SizedBox(height: heightSize*0.02),
            // text pass
            Container(
              // color: Colors.pink,
                padding: EdgeInsets.only(left: 40.0,bottom: 10,), // Add padding from the left side
                alignment: Alignment.centerLeft,
                child: Text('Password', style: TextStyle(fontWeight:FontWeight.bold,fontSize: widthSize*0.045,),
                )
            ),
            //Password
            Container(
              width: widthSize*0.8,
              height: heightSize*0.065,
              child: TextField(
                controller: confirmPasswordController,
                cursorColor: Colors.green,
                decoration: InputDecoration(
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
            // text Confirm pass
            Container(
              // color: Colors.pink,
                padding: EdgeInsets.only(top:17,left: 40.0,bottom: 10,), // Add padding from the left side
                alignment: Alignment.centerLeft,
                child: Text('Confirm password', style: TextStyle(fontWeight:FontWeight.bold,fontSize: widthSize*0.045,),
                )
            ),
            //Confirm password
            Container(
              width: widthSize*0.8,
              height: heightSize*0.065,
              child: TextField(
                controller: passwordController,
                cursorColor: Colors.green,
                decoration: InputDecoration(
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
            //Terms and conditions
            Padding(
              padding: const EdgeInsets.only(left: 30,bottom: 30,),
              child: Row(
                children: [
                  Checkbox(
                    value: agreedToTerms,
                    onChanged: (newValue) {
                      setState(() {
                        agreedToTerms = newValue ?? false;
                      });
                    },
                  ),
                  Text(
                    'Agree to ',
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TermsAndConditionPage()),
                      );
                    },
                    child: Text(
                      'Terms and Conditions',
                      style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF054C94),),
                    ),
                  ),
                ],
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
                  //Register functionality here
                },
                child: Text(
                  'Register',
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
            //Have an account
            RichText(
              text: TextSpan(
                text: "Already have an account? ",
                style: TextStyle(color: Colors.black,),
                children: [
                  TextSpan(
                    text: 'Sign in',
                    style: TextStyle(color: Color(0xFF054C94),fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
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
          if (newIndex == 3) { // Check if the 'Profile' item is clicked
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
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
            label: 'Camera',
            tooltip: 'Open Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white),
            label: 'Setting',
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
