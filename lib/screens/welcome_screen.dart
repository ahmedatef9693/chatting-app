import 'package:chatting_app_flutter/screens/login_screen.dart';
import 'package:chatting_app_flutter/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatting_app_flutter/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation animation;
  
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),vsync: this,
      );
      //animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
      animation = ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controller);
      //forward function start the from 0.0 to 1.0 animation
      controller.forward();
      // animation.addStatusListener((status) {
      //   if(status == AnimationStatus.completed){
      //     controller.reverse(from: 1.0);
      //   }else if(status == AnimationStatus.dismissed){
      //     controller.forward();

      //   }
      // });
            
      controller.addListener(() {
        setState(() {
          print(animation.value);
          
        });

      });
        
      
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                // here is our first hero widget
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 64.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts:[TypewriterAnimatedText('Flash Chat',textStyle: 
                  TextStyle(
                    color: Colors.black,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  ),
                  ],repeatForever: true,   
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              buttonColor:Colors.lightBlueAccent,
              buttonTitle: 'Log In',
              buttonCallback: (){
                Navigator.pushNamed(context, LoginScreen.id);
              },
               ),
               RoundedButton(
                 buttonColor: Colors.blueAccent,
                  buttonTitle: 'Register',
                   buttonCallback: (){
                     Navigator.pushNamed(context, RegistrationScreen.id);
                   })

          ],
        ),
      ),
    );
  }
}

