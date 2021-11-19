import 'package:flutter/material.dart';
import 'package:flutter_application/pages/components/login/bubble_model.dart';
import 'package:simple_animations/simple_animations.dart';

class BubblePainter extends CustomPainter {
  List<BubbleModel> bubbles;

  BubblePainter(this.bubbles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withAlpha(50);

    bubbles.forEach((bubble) {
      final progress = bubble.progress();
      final MultiTweenValues<BubbleOffsetProps> animation =
          bubble.tween.transform(progress);
      final position = Offset(
          animation.get<double>(BubbleOffsetProps.x) * size.width,
          animation.get<double>(BubbleOffsetProps.y) * size.height);
      canvas.drawCircle(position, size.width * 0.2 * bubble.size, paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}
