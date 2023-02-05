import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';

import 'dart:convert';

class DocumentAbuseEntry {
  final String text;
  final Uint8List? image;
  final Uint8List? audio;
  DocumentAbuseEntry(this.text, this.image, this.audio);

  void saveEntry() async {
    final timestamp = DateTime.now();
    final indexString =
        "${timestamp.year}/${timestamp.month}/${timestamp.day}/${timestamp.hour}:${timestamp.minute}:${timestamp.second}";

    DatabaseReference dataRef =
        FirebaseDatabase.instance.ref("data/documentAbuseDb/$indexString");

    DatabaseReference indexRef = FirebaseDatabase.instance.ref(
        "index/documentAbuseDb/${timestamp.year}/${timestamp.month}/${timestamp.day}");

    dataRef.set({
      'text': text,
      'image': _encodeImage(image),
      'audio': _encodeAudio(audio)
    });

    indexRef
        .push()
        .set(timestamp.toIso8601String().replaceAll(RegExp(r'\..*'), ''));
  }

  List<DocumentAbuseEntry> getEntries() {
    List<DocumentAbuseEntry> entries = [];

    return entries;
  }

  static Future<DocumentAbuseEntry> getFromTimestamp(DateTime timestamp) async {
    final indexString =
        "${timestamp.year}/${timestamp.month}/${timestamp.day}/${timestamp.hour}:${timestamp.minute}:${timestamp.second}";

    DatabaseReference dataRef =
        FirebaseDatabase.instance.ref("data/documentAbuseDb/$indexString");

    final snapshot = await dataRef.get();

    Uint8List? audioData;
    if ((snapshot.value as Map)['audio'] as String != '') {
      audioData = base64Decode((snapshot.value as Map)['audio'] as String);
    }

    Uint8List? imageData;
    if ((snapshot.value as Map)['image'] as String != '') {
      imageData = base64Decode((snapshot.value as Map)['image'] as String);
    }

    return DocumentAbuseEntry(
        (snapshot.value as Map)['text'] as String, imageData, audioData);
  }

  String _encodeImage(Uint8List? imageData) {
    return imageData == null ? '' : base64Encode(imageData);
  }

  String _encodeAudio(Uint8List? audioData) {
    return audioData == null ? '' : base64Encode(audioData);
  }
}
