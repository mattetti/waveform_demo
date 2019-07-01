import 'package:flutter/material.dart';
import 'package:waveform_demo/ui/views/clipper_view.dart';
import 'package:waveform_demo/ui/views/painter_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Waveform Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => ClipperView(),
        '/painter': (context) => PainterView(),
      },
    );
  }
}
