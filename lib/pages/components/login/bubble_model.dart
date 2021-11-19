import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';


enum BubbleOffsetProps { x, y }

class BubbleModel {
  late double size;
  late MultiTween<BubbleOffsetProps> tween;
  late Duration duration;
  late Duration startTime;
  Random random;

  BubbleModel(this.random) {
    _restart();
    _shuffle();
  }

  _restart() {
    final startPosition = Offset(-0.2 + 1.4 * random.nextDouble(), 1.2);
    final endPosition = Offset(-0.2 + 1.4 * random.nextDouble(), -0.2);

    // supercharged 是一个flutter的一个拓展方法，
    // 下面 startPosition.dx.tweenTo(endPosition.dx) 和 3000.milliseconds 都是 supercharged 带来的拓展方法
    tween = MultiTween<BubbleOffsetProps>()
      ..add(BubbleOffsetProps.x, startPosition.dx.tweenTo(endPosition.dx))
      ..add(BubbleOffsetProps.y, startPosition.dy.tweenTo(endPosition.dy));
    // (控制气泡运动速度，duration越大，运动越慢)
    duration = 3000.milliseconds + random.nextInt(6000).milliseconds;
    startTime = DateTime.now().duration();
    // 控制气泡大小（随机性）传入至painter中绘制圆
    size = 0.2 + random.nextDouble() * 0.5;
  }

  void _shuffle() {
    startTime -= Duration(
      milliseconds:
      (this.random.nextDouble() * duration.inMicroseconds).round()
    );
  }

  checkIfParticleNeedsToBeRestarted() {
    if (progress() == 1.0) {
      _restart();
    }
  }

  double progress() {
    return ((DateTime.now().duration() - startTime) / duration)
        .clamp(0.0, 1.0)
        .toDouble();
  }
}
