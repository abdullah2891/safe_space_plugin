import 'dart:convert';
import 'dart:typed_data';

import '../database/database_proxy.dart';

class DocumentAbuseEntry {
  final String text;
  final Uint8List? image;
  final Uint8List? audio;
  DocumentAbuseEntry(this.text, this.image, this.audio);

  void saveEntry() async {
    DatabaseProxy('documentAbuseDb').saveIndexedData({
      'text': text,
      'image': _encodeImage(image),
      'audio': _encodeAudio(audio)
    });
  }

  List<DocumentAbuseEntry> getEntries() {
    List<DocumentAbuseEntry> entries = [];

    return entries;
  }

  static Future<DocumentAbuseEntry> getFromTimestamp(DateTime timestamp) async {
    final snapshot = await DatabaseProxy('documentAbuseDb')
        .getFromTimestamp(timestamp) as Map;

    Uint8List? audioData;
    if (snapshot['audio'] as String != '') {
      audioData = base64Decode(snapshot['audio'] as String);
    }

    Uint8List? imageData;
    if (snapshot['image'] as String != '') {
      imageData = base64Decode(snapshot['image'] as String);
    }

    return DocumentAbuseEntry(snapshot['text'] as String, imageData, audioData);
  }

  String _encodeImage(Uint8List? imageData) {
    return imageData == null ? '' : base64Encode(imageData);
  }

  String _encodeAudio(Uint8List? audioData) {
    return audioData == null ? '' : base64Encode(audioData);
  }
}
