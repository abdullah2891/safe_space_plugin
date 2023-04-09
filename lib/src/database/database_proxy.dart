import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utility/auth.dart';
import '../utility/config.dart';

enum DatabaseType { hive, firebase }

class DatabaseProxy {
  static final Map<String, Box> _boxes = {};
  static final DatabaseType _databaseType =
      Config().isDemo ? DatabaseType.hive : DatabaseType.firebase;
  static String? _uid;

  static Future<void> _initialize() async {
    if (_uid == null) {
      try {
        _uid = Auth.currentUserId;
      } catch (e) {
        _uid = 'test';
      }
    }
  }

  static Future<Box> _getBox(String name) async {
    if (_boxes.isEmpty) {
      await Hive.initFlutter();
    }

    if (!_boxes.containsKey(name)) {
      _boxes[name] = await Hive.openBox(name);
    }

    return _boxes[name]!;
  }

  static String get uid => _uid!;

  static Future<Box> getBox(String name) => _getBox(name);

  final String _table;

  DatabaseProxy(this._table);

  String _getDayKey(DateTime timestamp) =>
      "${timestamp.year}/${timestamp.month}/${timestamp.day}/";
  String _getTimeKey(DateTime timestamp) => "${_getDayKey(timestamp)}/"
      "${timestamp.hour}:${timestamp.minute}:${timestamp.second}";

  String _getIndexKey(DateTime timestamp) =>
      "$uid/index/$_table/${_getDayKey(timestamp)}";
  String _getIndexedDataKey(DateTime timestamp) =>
      "$uid/data/$_table/${_getTimeKey(timestamp)}";
  String _getDataKey(String key) => "$uid/data/$_table/$key";

  String _timeKey(DateTime time) =>
      time.toIso8601String().replaceAll(RegExp(r'\..*'), '');

  Future<void> saveIndexedData(dynamic value) async {
    await _initialize();
    final now = DateTime.now();

    if (_databaseType == DatabaseType.hive) {
      final hiveBox = await _getBox(_table);

      hiveBox.put(_getIndexedDataKey(now), value);

      final indexArray = [];
      final indexData = hiveBox.get(_getIndexKey(now));
      if (indexData != null) {
        indexArray.addAll(jsonDecode(indexData));
      }
      indexArray.add(_timeKey(now));
      hiveBox.put(_getIndexKey(now), jsonEncode(indexArray));
    } else {
      DatabaseReference dataRef =
          FirebaseDatabase.instance.ref(_getIndexedDataKey(now));

      dataRef.set(value);

      DatabaseReference indexRef =
          FirebaseDatabase.instance.ref(_getIndexKey(now));
      indexRef.push().set(_timeKey(now));
    }
  }

  Future<List<DateTime>> getIndexedTimes(DateTime timestamp) async {
    await _initialize();
    final indexKey = _getIndexKey(timestamp);

    List<DateTime> keys = [];

    if (_databaseType == DatabaseType.hive) {
      final hiveBox = await _getBox(_table);

      final indexData = hiveBox.get(indexKey);
      if (indexData != null) {
        final indexArray = jsonDecode(indexData);
        for (final index in indexArray) {
          try {
            keys.add(DateTime.parse(index));
          } catch (e) {
            debugPrint(e.toString());
          }
        }
      }
    } else {
      DatabaseReference indexRef = FirebaseDatabase.instance.ref(indexKey);

      final entries = await indexRef.get();
      for (final entry in entries.children) {
        keys.add(DateTime.parse(entry.value as String));
      }
    }
    return keys;
  }

  Future<dynamic> getFromTimestamp(DateTime timestamp) async {
    await _initialize();
    final dataKey = _getIndexedDataKey(timestamp);

    if (_databaseType == DatabaseType.hive) {
      final hiveBox = await _getBox(_table);
      return hiveBox.get(dataKey);
    } else {
      DatabaseReference dataRef = FirebaseDatabase.instance.ref(dataKey);

      final snapshot = await dataRef.get();
      return snapshot.value;
    }
  }

  Future<void> put(String key, dynamic value) async {
    await _initialize();
    final dataKey = _getDataKey(key);

    if (_databaseType == DatabaseType.hive) {
      final hiveBox = await _getBox(_table);

      hiveBox.put(dataKey, value);
    } else {
      DatabaseReference dataRef = FirebaseDatabase.instance.ref(dataKey);

      dataRef.set(value);
    }
  }

  Future<dynamic> get(String key) async {
    await _initialize();
    final dataKey = _getDataKey(key);

    if (_databaseType == DatabaseType.hive) {
      final hiveBox = await _getBox(_table);
      return await hiveBox.get(dataKey);
    } else {
      DatabaseReference dataRef = FirebaseDatabase.instance.ref(dataKey);

      final snapshot = await dataRef.get();
      return snapshot.value;
    }
  }

  Future<void> del(String key) async {
    await _initialize();
    final dataKey = _getDataKey(key);

    if (_databaseType == DatabaseType.hive) {
      final hiveBox = await _getBox(_table);
      return await hiveBox.delete(dataKey);
    } else {
      DatabaseReference dataRef = FirebaseDatabase.instance.ref(dataKey);

      return await dataRef.remove();
    }
  }
}
