import 'package:flutter/material.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({Key? key}) : super(key: key);

  @override
  _LoginBottomSheetState createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30,horizontal: 15),
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Login".toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Text("Enter your phone number to proceed",style: TextStyle(color: Colors.grey.shade600,fontSize: 12),),
        ],
      ),
    );
  }
}
