import 'package:flutter/material.dart';
import 'package:waveform_demo/ui/widgets/app_bar.dart';
import 'package:waveform_demo/ui/widgets/bottom_app_bar.dart';

class ClipperView extends StatelessWidget {
  const ClipperView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sharedAppBar(context, "Waveform Clipper"),
      //
      bottomNavigationBar: sharedBottomAppBar(context),
      //
      body: Center(
        child: Column(children: <Widget>[Text("The Clipper View will render here!")]),
      ),
    );
  }
}
