import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

class WaveformData {
  int version;
  // number of channels (only mono files are currently supported)
  int channels;
  // original sample rate
  int sampleRate;
  // indicates how many original samples have been analyzed per frame. 256 samples -> frame of min/max
  int sampleSize;
  // bit depth of the data
  int bits;
  // the number of frames contained in the data
  int length;
  // data is in frames with min and max values for each sampled data point.
  List<int> data;

  WaveformData({
    this.version,
    this.channels,
    this.sampleRate,
    this.sampleSize,
    this.bits,
    this.length,
    this.data,
  });

  factory WaveformData.fromJson(String str) => WaveformData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WaveformData.fromMap(Map<String, dynamic> json) => new WaveformData(
        version: json["version"] == null ? null : json["version"],
        channels: json["channels"] == null ? null : json["channels"],
        sampleRate: json["sample_rate"] == null ? null : json["sample_rate"],
        sampleSize: json["samples_per_pixel"] == null ? null : json["samples_per_pixel"],
        bits: json["bits"] == null ? null : json["bits"],
        length: json["length"] == null ? null : json["length"],
        data: json["data"] == null ? null : new List<int>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "version": version == null ? null : version,
        "channels": channels == null ? null : channels,
        "sample_rate": sampleRate == null ? null : sampleRate,
        "samples_per_pixel": sampleSize == null ? null : sampleSize,
        "bits": bits == null ? null : bits,
        "length": length == null ? null : length,
        "data": data == null ? null : new List<dynamic>.from(data.map((x) => x)),
      };
}
