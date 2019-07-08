import 'package:flutter_web/services.dart';
import 'package:waveform_web_demo/core/models/waveform_data_model.dart';

Future<WaveformData> loadWaveformData(String filename) async {
  final data = await rootBundle.loadString("assets/waveforms/$filename");
  return WaveformData.fromJson(data);
}
