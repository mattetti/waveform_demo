import 'package:flutter_web/material.dart';
import 'package:waveform_web_demo/core/models/waveform_data_model.dart';
import 'package:waveform_web_demo/core/services/waveform_data_loader.dart';
import 'package:waveform_web_demo/ui/widgets/app_bar.dart';
import 'package:waveform_web_demo/ui/widgets/bottom_app_bar.dart';

class ClipperView extends StatelessWidget {
  const ClipperView({Key key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: sharedAppBar(context, "Waveform Clipper"),
      bottomNavigationBar: sharedBottomAppBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Container(
                color: Colors.grey[900],
                child: FutureBuilder<WaveformData>(
                  future: loadWaveformData("loop.json"),
                  builder: (context, AsyncSnapshot<WaveformData> snapshot) {
                    if (snapshot.hasData) {
                      return LayoutBuilder(builder: (context, BoxConstraints constraints) {
                        // adjust the shape based on parent's orientation/shape
                        // the waveform should always be wider than taller
                        var height;
                        if (constraints.maxWidth < constraints.maxHeight) {
                          height = constraints.maxWidth;
                        } else {
                          height = constraints.maxHeight;
                        }

                        return ClipPath(
                          clipper: WaveformClipper(snapshot.data),
                          child: Container(
                            height: height,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [0.1, 0.3, 0.9],
                                colors: [
                                  Color(0xffFEAC5E),
                                  Color(0xffC779D0),
                                  Color(0xff4BC0C8),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                    } else if (snapshot.hasError) {
                      return Text("Error ${snapshot.error}", style: TextStyle(color: Colors.red));
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WaveformClipper extends CustomClipper<Path> {
  WaveformClipper(this.data);

  final WaveformData data;

  @override
  Path getClip(Size size) {
    return data.path(size);
  }

  @override
  bool shouldReclip(WaveformClipper oldClipper) {
    if (data != oldClipper.data) {
      return true;
    }
    return false;
  }
}
