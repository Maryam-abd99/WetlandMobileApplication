import 'package:flutter/material.dart';
import 'resetPassword.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  double widthSize = 0.0;
  double heightSize = 0.0;
  @override
  Widget build(BuildContext context) {
    widthSize = MediaQuery.of(context).size.width;
    heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF46923c),
        title: Text("Reset Password"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Arrow icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //1 text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: heightSize*0.08),
                Text('Forget Password ?', style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: widthSize*0.07),),
                SizedBox(height: heightSize*0.012,),
                Text("Enter your registered email below to receive\npassword reset instruction",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: widthSize*0.0012,
                      color: Colors.grey[700],
                      fontSize: widthSize*0.04
                  ),),
              ],
            ),
            SizedBox(height: heightSize*0.05,),
            // image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/undraw_Forgot_password_re_hxwm.png',
                  // width: widthSize,
                  height: heightSize*0.3,
                )
              ],
            ),
            // text email
            Container(
              // color: Colors.pink,
                padding: EdgeInsets.only(top:26,left: 40.0,bottom: 10,), // Add padding from the left side
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
                  hintStyle: TextStyle(color: Colors.grey[600]),
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
            SizedBox(height: heightSize*0.03,),
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
                  // Navigate to ResetPasswordPage when button is clicked
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordPage()));},
                child: Text(
                  'Send Reset Link',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: widthSize*0.048,),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF46923c), // White background when it's not clicked
                  foregroundColor: Colors.white, // White background when it's clicked
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
