import 'package:flutter/material.dart';
import 'package:waveform_demo/ui/widgets/app_bar.dart';
import 'package:waveform_demo/ui/widgets/bottom_app_bar.dart';

class PainterView extends StatelessWidget {
  const PainterView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sharedAppBar(context, "Waveform Painter"),
      //
      bottomNavigationBar: sharedBottomAppBar(context),
      //
      body: Center(
        child: Column(children: <Widget>[Text("The Painter View will render here!")]),
      ),
    );
  }
}
