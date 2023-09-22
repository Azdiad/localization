import 'dart:async';

import 'package:animation/View/Homepage/Home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.network(
          'https://lottie.host/b803d9d2-d598-4c31-934f-8716db959e83/U691K43wcP.json'),
    );
  }
}
