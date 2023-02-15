import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vectors;

class Compass extends StatefulWidget {
  @override
  _CompassState createState() => _CompassState();
}

class _CompassState extends State<Compass> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.duration = Duration(seconds: 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: 300.0,
      height: 300.0,
      child: Stack(
        children: [
          Positioned(
            left: 220,
            top: 200,
            child: Transform.rotate(
              angle: _controller.value * 2.0 * math.pi,
              child: CustomPaint(
                size: Size(500, 500),
                painter: CompassPainter(),
              ),
            ),
          ),
          Positioned(
            left: 220,
            top: 300,
            child: ElevatedButton(
              onPressed: () {
                _controller.forward();
              },
              child: Text("Start"),
            ),
          ),
        ],
      ),
    );
  }
}

// class MyCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 5;
//     canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), paint);
//   }
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

class CompassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print(size.width);
    final paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.5;

    canvas.drawCircle(
      Offset(250 / 2, 250 / 2),
      250 / 2 - 10.0,
      paint,
    );

    for (int i = 0; i < 360; i += 30) {
      canvas.drawLine(
        Offset(250 / 2, 250 / 2),
        Offset(
          250 / 2 +
              (250 / 2 - 10.0) *
                  math.cos(vectors.radians(i.toDouble())),
          250 / 2 +
              (250 / 2 - 10.0) *
                  math.sin(vectors.radians(i.toDouble())),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

