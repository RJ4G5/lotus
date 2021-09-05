import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(600, 450);
    win.minSize = initialSize;
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
                    MinimizeWindowButton(colors: buttonColors),
                    MaximizeWindowButton(colors: buttonColors),
                    CloseWindowButton(
                        colors: WindowButtonColors(
                            mouseOver: Color(0xFFD32F2F),
                            mouseDown: Color(0xFFB71C1C),
                            iconNormal: Colors.white,
                            iconMouseOver: Colors.white)),
                  ],
                )
              ])),
            ])));
  }
}

final buttonColors = WindowButtonColors(
    iconNormal: Colors.white,
    mouseOver: Color(0x69E8EAF6),
    mouseDown: Color(0x69C5CAE9),
    iconMouseOver: Colors.white,
    iconMouseDown: Colors.white);
