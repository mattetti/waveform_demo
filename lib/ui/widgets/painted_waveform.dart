import 'package:flutter/material.dart';
import 'package:waveform_demo/core/models/waveform_data_model.dart';
import 'package:waveform_demo/ui/widgets/waveform_painter.dart';

class PaintedWaveform extends StatefulWidget {
  PaintedWaveform({
    Key key,
    @required this.sampleData,
  }) : super(key: key);

  final WaveformData sampleData;

  @override
  _PaintedWaveformState createState() => _PaintedWaveformState();
}

class _PaintedWaveformState extends State<PaintedWaveform> {
  double startPosition = 1.0;
  double zoomLevel = 1.0;

  @override
  Widget build(context) {
    return Container(
      color: Colors.black87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 4,
            child: LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                // adjust the shape based on parent's orientation/shape
                // the waveform should always be wider than taller
                var height;
                if (constraints.maxWidth < constraints.maxHeight) {
                  height = constraints.maxWidth;
                } else {
                  height = constraints.maxHeight;
                }

                return Container(
                  child: Row(
                    children: <Widget>[
                      CustomPaint(
                        size: Size(
                          constraints.maxWidth,
                          height,
                        ),
                        foregroundPainter: WaveformPainter(
                          widget.sampleData,
                          zoomLevel: zoomLevel,
                          startingFrame: widget.sampleData.frameIdxFromPercent(startPosition),
                          color: Color(0xff3994DB),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Flexible(
            child: Slider(
              activeColor: Colors.indigoAccent,
              min: 1.0,
              max: 95.0,
              divisions: 42,
              onChanged: (newzoomLevel) {
                setState(() => zoomLevel = newzoomLevel);
              },
              value: zoomLevel,
            ),
          ),
          Flexible(
            child: Slider(
              activeColor: Colors.indigoAccent,
              min: 1.0,
              max: 95.0,
              divisions: 42,
              onChanged: (newstartPosition) {
                setState(() => startPosition = newstartPosition);
              },
              value: startPosition,
            ),
          )
        ],
      ),
    );
  }
}
