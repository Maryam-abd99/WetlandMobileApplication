import 'package:flutter/material.dart';
import 'registration.dart';
class TermsAndConditionPage extends StatefulWidget {
  const TermsAndConditionPage({super.key});

  @override
  State<TermsAndConditionPage> createState() => _TermsAndConditionPageState();
}

class _TermsAndConditionPageState extends State<TermsAndConditionPage> {
  double widthSize = 0.0;
  double heightSize = 0.0;
  @override
  Widget build(BuildContext context) {
    widthSize = MediaQuery.of(context).size.width;
    heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF46923c),
        title: Text("Terms and Condition"),
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
            Text("Terms and Conditions")
          ],
        ),
      ),
    );
  }
}
