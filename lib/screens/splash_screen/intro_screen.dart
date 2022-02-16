import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_flutter/commons/app_styles.dart';

import '../../commons/app_colors.dart';
import 'login_bottomsheet.dart';
class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  showLoginBottomSheet(){
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        //TODO FINAL WAY TO ADD A BLUR BG (STILL I WONT PREFER)
         backgroundColor: Colors.white.withOpacity(0.5),
        barrierColor: Colors.white.withOpacity(0),
        isScrollControlled: true,
        builder: (context) {
          return LoginBottomSheet();
          ///ALTERNATIVELY USE A STATEFUL BUILDER IF  YOU DONT NEED TO IMPLEMENT IN ANOTHER WIDGET

            // StatefulBuilder(
            //   builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
            //     return Container(
            //       height: 100,
            //       child: RaisedButton(onPressed: () {
            //         setState(() {
            //          // heightOfModalBottomSheet += 10;
            //         });
            //       }),
            //     );
            //   });
        });
  }
  int selectedindex = 0;
  List widgetList = [
    'https://media.istockphoto.com/vectors/woman-with-laptop-sitting-in-nature-and-leaves-concept-illustration-vector-id1139913278?k=20&m=1139913278&s=612x612&w=0&h=Ue0Nh74fYCnNd5hfwBCLwJ2VeZqjXxnI5iEXqqTLXb8=',
    'https://design4users.com/wp-content/uploads/2020/10/autumn-illustrations-tubik-arts.jpg',
    'https://media.agoodson.com/wp-content/uploads/2020/04/juggle_story-tognola-lowres-1.jpg',
    'https://global-uploads.webflow.com/5e3ce2ec7f6e53c045fe7cfa/60955554f04885677e96624a_Frame%2017.png'

  ];

  List images = [
    'https://media.istockphoto.com/vectors/woman-with-laptop-sitting-in-nature-and-leaves-concept-illustration-vector-id1139913278?k=20&m=1139913278&s=612x612&w=0&h=Ue0Nh74fYCnNd5hfwBCLwJ2VeZqjXxnI5iEXqqTLXb8=',
    'https://design4users.com/wp-content/uploads/2020/10/autumn-illustrations-tubik-arts.jpg',
    'https://media.agoodson.com/wp-content/uploads/2020/04/juggle_story-tognola-lowres-1.jpg',
    'https://global-uploads.webflow.com/5e3ce2ec7f6e53c045fe7cfa/60955554f04885677e96624a_Frame%2017.png'

  ];
  List text = [
    "Hey Test Text 1 Hey Test Text 1 Hey Test Text 1",
    "Hey Test Text 2",
    "Hey Test Text 3 Hey Test Text 1 Hey Test Text 1 Hey Test Text 1 Hey Test Text 3 Hey Test Text 3 Hey Test Text 1 Hey Test Text 1 Hey Test Text 1Hey Test Text 3 Hey Test Text 1 Hey Test Text 1 Hey Test Text 1 Hey Test Text 1 Hey Test Text 1 Hey Test Text 1",
    "Hey Test Text 4",

  ];
  PageController _pageController = PageController(initialPage: 0);
  late Timer _timer;

  changePage(){
    _pageController.animateToPage(
      selectedindex,
      duration: Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
  }

  @override
  void initState(){
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (selectedindex < images.length-1) {
        selectedindex++;
      } else {
        selectedindex = 0;
      }

      // _pageController.animateToPage(
      //   selectedindex,
      //   duration: Duration(milliseconds: 350),
      //   curve: Curves.easeIn,
      // );
      changePage();
    });
  }

  Widget _indicator(bool isActive) {
    return Container(
      height: 5,
      width: 35,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive
            ? 10:8.0,
        width: isActive
            ? 30:20,
        decoration: BoxDecoration(
          // boxShadow: [
          //   isActive
          //       ? BoxShadow(
          //     color: Color(0XFF2FB7B2).withOpacity(0.72),
          //     blurRadius: 4.0,
          //     spreadRadius: 1.0,
          //     offset: Offset(
          //       0.0,
          //       0.0,
          //     ),
          //   )
          //       : BoxShadow(
          //     color: Colors.transparent,
          //   )
          // ],
          //shape: BoxShape.circle,
          color: isActive ? Colors.black : Color(0XFFEAEAEA),
        ),
      ),
    );
  }
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < widgetList.length; i++) {
      list.add(i == selectedindex ? GestureDetector(onTap: () { setState(() {
        //selectedindex = i;
        //changePage();
      });},child: _indicator(true)) :  GestureDetector(onTap: (){
       setState(() {
         //selectedindex = i;
         //changePage();
       });
      },child: _indicator(false)) );
    }
    return list;
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size.height * 0.65,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) {
                setState(() {
                  selectedindex = page;
                });
              },
              itemCount: widgetList.length, itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(height: size.height * 0.5,child: Image.network(images[index],fit: BoxFit.fitHeight,)),
                        Container(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),child: Center(child: Text(text[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),maxLines: 3,)) ,)

                      ],
                    );
              },),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ..._buildPageIndicator().toList(),
              ],
            ),
            SizedBox(height: size.height *0.1,),
            Text("Ready to order from top resturants?"),
            MaterialButton(onPressed: (){showLoginBottomSheet();},child: Text("GET STARTED",style: AppStyles.textStyle1,),color: AppColors.swiggyOrange,),
          ],
        ),
      ),
    );
  }
}
