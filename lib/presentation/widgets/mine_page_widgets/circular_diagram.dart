// ignore_for_file: deprecated_member_use
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:todo_list/presentation/helpers/app_colors.dart';

class CircularDiagram extends StatelessWidget {
  final int total;
  final int done;

  const CircularDiagram({
    super.key,
    required this.total,
    required this.done,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 150,
      height: 150,
      child: CustomPaint(
        painter: CircleDiagramPainter(total: total, done: done),
      ),
    );
  }
}

class CircleDiagramPainter extends CustomPainter {
  int total;
  int done;

  CircleDiagramPainter({
    required this.total,
    required this.done,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeWidth = radius * 0.2;
    const strokeColor = Colors.transparent;
    final strokePaint = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final totalPercentage = total;
    final greyAngle = 2 * math.pi * (total / totalPercentage);
    final purpleAngle = 2 * math.pi * (done / totalPercentage);

    canvas.drawCircle(center, radius, strokePaint);
    canvas.drawCircle(center, radius - strokeWidth, strokePaint);

    final greyPaint = Paint()..color = Colors.grey;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      greyAngle,
      true,
      greyPaint,
    );

    final purplePaint = Paint()
      ..color = AppColors.borderColor
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + purpleAngle,
      purpleAngle,
      true,
      purplePaint,
    );

    final whitePaint = Paint()..color = AppColors.mainBackgroundColor;
    canvas.drawCircle(center, radius - strokeWidth, whitePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
