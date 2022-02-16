import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_flutter/commons/app_colors.dart';
import 'package:restaurant_flutter/commons/app_styles.dart';

import '../../commons/arcylic_blur.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({Key? key}) : super(key: key);

  @override
  _LoginBottomSheetState createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  bool isValid = false;
  final textEditingController = TextEditingController();
  navigateToNextPage(){

  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AcrylicBlur(
      blurValue: 10,
      alignment: Alignment.topLeft,
      color: Colors.white.withOpacity(0.5),
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            height: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login".toUpperCase(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Enter your phone number to proceed",
                  style: TextStyle(color: Colors.grey.shade900, fontSize: 12),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Phone Number".toUpperCase(),
                  style: TextStyle(color: Colors.grey.shade900, fontSize: 12),
                ),
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), prefixText: "+91 ",suffixIcon: isValid ? Icon(Icons.check) : null),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  keyboardType: TextInputType.number,

                  ///use this if you need counter
                  //maxLength: 10,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  onChanged: (String value){
                   setState(() {

                     isValid =  value.length == 10 ? true : false;
                   });

                  },
                ),
                SizedBox(height: 10,),
                MaterialButton(color: AppColors.swiggyOrange,disabledColor: AppColors.swiggyOrange.withOpacity(0.6),padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: 10),child: Center(child: Text("Continue".toUpperCase(),style: AppStyles.textStyle1,)),onPressed: isValid ? () => navigateToNextPage():null),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
