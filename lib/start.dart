import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:tip_calculator/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WELCOME',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.red[900],
              ),
            ),
            const SizedBox(height: 30,),
            Text(
              'This is a tip calculator app.\n\nIt can be used to calculate tip to be given to waiter at restaurants.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: Colors.red[900],
              ),
            ),
            const SizedBox(height: 30,),
            
            AnimatedButton(
              text: 'Get Started',
              animationDuration: Duration(milliseconds: 200),
              onPress: () {
                Future.delayed(
                  Duration(milliseconds: 250),(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                  }
                );
              },
              transitionType: TransitionType.CENTER_TB_OUT,
              height: 40,
              width: 250,
              borderRadius: 25,
              borderWidth: 2,
              gradient:
                  const LinearGradient(colors: [Colors.red, Colors.orange]),
              selectedGradientColor: const LinearGradient(
                  colors: [Colors.deepPurple, Colors.pink]),
              selectedTextColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
