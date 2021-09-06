import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(600, 450);
    win.minSize = initialSize;
    win.maxSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Lotus - Cadastro simples de clientes";
    win.show();
  });
}

const borderColor = Color(0xFF805306);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: WindowBorder(
                color: borderColor, width: 1, child: Row(children: [Home()]))));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(color: Color(0xFF3F51B5)),
            child: Column(children: [
              WindowTitleBarBox(
                  child: Row(children: [
                Expanded(child: MoveWindow()),
                Row(
                  children: [
                    MinimizeWindowButton(
                        colors: WindowButtonColors(
                            iconNormal: Colors.white,
                            mouseOver: Color(0x69E8EAF6),
                            mouseDown: Color(0x69C5CAE9),
                            iconMouseOver: Colors.white,
                            iconMouseDown: Colors.white)),
                    CloseWindowButton(
                        colors: WindowButtonColors(
                            mouseOver: Color(0xFFD32F2F),
                            mouseDown: Color(0xFFB71C1C),
                            iconNormal: Colors.white,
                            iconMouseOver: Colors.white)),
                  ],
                ),
              ])),
              Spacer(),
              CustomPaint(
                  child: Container(
                    height: 350,
                    //decoration: BoxDecoration(color: Color(0xffffffff)),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.only(left: 48.0, top: 0),
                            transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 5),
                              shape: BoxShape.circle,
                              color: Colors.white,
                              // image: DecorationImage(
                              //  fit: BoxFit.cover,
                              //    image: AssetImage('images/profile.png'),
                              //    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  painter: MyPainter())
            ])));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = Color(0xffffffff);
    path = Path();

    path.lineTo(size.width * 0.31, 0);
    path.cubicTo(size.width * 0.3, size.height * 0.01, size.width * 0.3,
        size.height * 0.01, size.width * 0.3, size.height * 0.02);
    path.cubicTo(size.width * 0.3, size.height * 0.18, size.width / 5,
        size.height * 0.28, size.width * 0.12, size.height / 5);
    path.cubicTo(size.width * 0.08, size.height * 0.16, size.width * 0.06,
        size.height * 0.09, size.width * 0.06, size.height * 0.02);
    path.cubicTo(size.width * 0.06, size.height * 0.01, size.width * 0.06,
        size.height * 0.01, size.width * 0.05, 0);
    path.cubicTo(size.width * 0.05, 0, 0, 0, 0, 0);
    path.cubicTo(0, 0, 0, size.height, 0, size.height);
    path.cubicTo(
        0, size.height, size.width, size.height, size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width * 0.31, 0, size.width * 0.31, 0);
    path.cubicTo(
        size.width * 0.31, 0, size.width * 0.31, 0, size.width * 0.31, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
