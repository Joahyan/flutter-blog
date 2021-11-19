import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application/pages/components/login/bubble_model.dart';
import 'package:flutter_application/pages/components/login/bubble_painter.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';


class BubbleWidget extends StatefulWidget {
  final int numOfBubble;

  BubbleWidget(this.numOfBubble);

  _BubbleWidgetState createState()=> _BubbleWidgetState();
}

class _BubbleWidgetState extends State<BubbleWidget> {
  final Random random = Random();
  
  final List<BubbleModel> bubbles = [];
  
  @override
  void initState() {
    // TODO: implement initState
    widget.numOfBubble.times(() {bubbles.add(BubbleModel(random));});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoopAnimation(
      tween: ConstantTween(1),
      builder: (context, child, dynamic _) {
        _simulateParticles();
        return CustomPaint(
          painter: BubblePainter(bubbles),
        );
      },
    );
  }
  _simulateParticles() {
    bubbles
        .forEach((particle) => particle.checkIfParticleNeedsToBeRestarted());
  }


}