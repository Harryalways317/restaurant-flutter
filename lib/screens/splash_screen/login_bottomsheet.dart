import 'package:flutter/material.dart';

import '../../commons/arcylic_blur.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({Key? key}) : super(key: key);

  @override
  _LoginBottomSheetState createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return AcrylicBlur(
      blurValue: 10,
      alignment: Alignment.topLeft,
      color: Colors.white.withOpacity(0.5),
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30,horizontal: 15),
            height: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login".toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text("Enter your phone number to proceed",style: TextStyle(color: Colors.grey.shade900,fontSize: 12),),
                SizedBox(height: 15,),
                Text("Phone Number".toUpperCase(),style: TextStyle(color: Colors.grey.shade900,fontSize: 12),),
                TextField(autofocus: true,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
