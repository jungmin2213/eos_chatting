import 'package:flutter/material.dart';
import 'package:eos_chatting/config/palette.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  //TODO : isSignUpScreen 변수 선언
  bool isSignUpScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO : background color로 palette의 backgroundColor 설정,
        backgroundColor: Palette.backgroundColor,
        body: Stack(
          children: [
            Positioned(
              //TODO : top, left, right 모두 0으로 설정
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  //TODO : height 300으로 설정
                  height: 300.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      //TODO : background.png 넣기
                        image: AssetImage("assets/background.png"),
                        fit: BoxFit.fill
                    ),
                  ),
                  child: Container(
                    //TODO : padding top 90, left 20
                    padding: EdgeInsets.only(top: 90, left: 20),
                    child: Column(
                      //TODO : 왼쪽 정렬,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                              //TODO : letter spacing 1.0, font size 25, color white
                                text: 'Welcome ',
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    //TODO : letter spacing 1.0, font size 25, color white, bold
                                    text: isSignUpScreen? 'to EOS chat': 'back',
                                    style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ]
                            )
                        ),
                        SizedBox(
                          //TODO :  height 5.0으로 글 사이 간격 주기
                            height: 5.0
                        ),
                        Text(
                          //TODO : spacing 1.0, color white
                          isSignUpScreen? 'Signup to Continue' : 'Signin to Continue',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
                //TODO : top 150
                top: 150.0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  //TODO : height 280.0, padding 모두 20, width 핸드폰 가로 길이 - 40
                  //TODO : margin 가로로 양쪽 20
                  height: isSignUpScreen?  280.0 : 250.0,
                  padding: EdgeInsets.all(20.0),
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),

                  decoration: BoxDecoration(
                    //TODO : color whtie, border radius 15
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          //TODO : color black, 투명도 0.3, blur radius 15, spread radius 5
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15.0,
                          spreadRadius: 5.0,
                        )
                      ]
                  ),
                  child: Column(
                      children: [
                        Row(
                          //TODO : mainAxisAlignment.spaceAround
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignUpScreen = false;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    //TODO : font size 16, bold
                                    'LOGIN',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      decoration: isSignUpScreen? TextDecoration.underline : null,
                                      color: isSignUpScreen ? Palette.textColor1 : Palette.activeColor,
                                    ),
                                    //TODO : isSignupScreen이 false면 palette의 activeColor, true면 palette의 textcolor1
                                  ),
                                  isSignUpScreen
                                    ? SizedBox()
                                    //TODO : isSignupScreen이 false일 때만 밑줄이 생기도록
                                    : Container(
                                      //TODO : margin top만 3, height 2, width 55, color green
                                      margin: EdgeInsets.only(top: 3.0),
                                      height: 2.0,
                                      width: isSignUpScreen ? 0 : 55.0,
                                      color: Colors.green,
                                    )
                                ],
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSignUpScreen = true;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      //TODO : font size 16, bold
                                      //TODO : isSignupScreen이 true면 palette의 activeColor, false면 palette의 textColor1
                                      'SIGNUP',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        decoration: isSignUpScreen? TextDecoration.underline : null,
                                        color: isSignUpScreen ? Palette.activeColor : Palette.textColor1,
                                      ),
                                    ),
                                    //TODO : isSignUpScreen이 true일 때만 밑줄이 생기도록

                                    isSignUpScreen
                                        ? Container(
                                        //TODO : margin top만 3, height 2, width 55, color green
                                        margin: EdgeInsets.only(top: 3),
                                        height: 2,
                                        width: isSignUpScreen ? 55.0 : 0,
                                        color: isSignUpScreen ? Colors.green : Colors.transparent,
                                        )
                                        :SizedBox()
                                  ],
                                )
                            )
                          ],
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                            margin: EdgeInsets.only(top: 20.0),
                            child: Form(
                              child: Column(
                                  children: [
                                    isSignUpScreen ?
                                    TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'User name',
                                        hintStyle: TextStyle(color: Palette.iconColor),
                                        //TODO : prefix icon 원하는 icon 입력, color는 palette의 iconColor
                                        prefixIcon: Icon(Icons.email, color: Palette.iconColor),
                                        enabledBorder: OutlineInputBorder(
                                          //TODO : borderside 색은 palette의 textColot1
                                          //TODO : border radius는 모두 35
                                          borderSide: BorderSide(color: Palette.textColor1), // borderSide 설정
                                          borderRadius: BorderRadius.circular(35.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          //TODO : borderside 색은 palette의 textColot1
                                          //TODO : border radius는 모두 35
                                          borderSide: BorderSide(color: Palette.textColor1), // borderSide 설정
                                          borderRadius: BorderRadius.circular(35.0),
                                        ),
                                      ),
                                    )
                                        : SizedBox(),
                                    SizedBox(height: 8,),

                                    TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'email',
                                        hintStyle: TextStyle(color: Palette.iconColor),
                                        prefixIcon: Icon(Icons.email),
                                        prefixIconColor: Palette.iconColor,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(35),
                                          borderSide: BorderSide(
                                            color: Palette.textColor1
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(35),
                                          borderSide: BorderSide(
                                            color: Palette.textColor1
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8,),

                                    TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'password',
                                        hintStyle: TextStyle(color: Palette.iconColor),
                                        prefixIcon: Icon(Icons.lock),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(35),
                                          borderSide: BorderSide(
                                            color: Palette.textColor1
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(35),
                                          borderSide: BorderSide(
                                            color: Palette.textColor1,
                                          ),
                                        ),
                                      ),
                                    )
                                  ]
                              ),
                            )
                        )
                      ]
                  ),
                )
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: isSignUpScreen? 390 : 340,
                right: 0,
                left: 0,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.lightGreen, Colors.green],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight
                              ),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white, width: 10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 1)
                              )
                            ]
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white
                          ),
                        )
                    ),
                ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height - 125,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text('or Signin with'),
                  SizedBox(height: 10),
                  TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(155, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Palette.googleColor,
                    ),
                    icon: Icon(Icons.add),
                    label: Text('Google'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}