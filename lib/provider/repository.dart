import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spartan_foods/constants/Tables.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

class Repository {
  static final instance = Repository._internal();

  static final Map<String, String> _createTableQueries = {
    '${Tables.favoriteFoods}': 'foodName TEXT PRIMARY KEY'
  };

  static String getCreateQuery(String tableName, String schema) => 'CREATE TABLE IF NOT EXISTS $tableName ($schema)';

  bool _initialized = false;
  Lock _lock = new Lock();
  List<VoidCallback> _onReadyCallbacks = [];
  Database _handle;

  Repository._internal() {}

  Future<String> get _localPath async {
    var directory = await getApplicationDocumentsDirectory();

    String pathName = join(directory.path, 'spartanFoods.db');

    bool exists = await directory.exists();

    if (!exists) {
      await directory.create(recursive: true);
    }

    return pathName;
  }

  Future<Database> getHandle() async {
    if (_handle != null) {
      return _handle;
    }

    if (!_initialized) {
      _start().catchError(print);
    }

    Completer<Database> completer = new Completer();

    VoidCallback callback = () {
      completer.complete(_handle);
    };

    _onReadyCallbacks.add(callback);

    return completer.future;
  }

  Future _createTablesOnOpen(Database db) async {
    List<Future> futures = [];

    for (var entry in _createTableQueries.entries) {
      futures.add(db.execute(getCreateQuery(entry.key, entry.value)));
    }

    await Future.wait(futures);
  }

  Future _start() async {
    await _lock.synchronized(() async {
      _initialized = true;
      _handle = await openDatabase(await _localPath, onOpen: _createTablesOnOpen);

      for (var callback in _onReadyCallbacks) {
        callback();
      }

      _onReadyCallbacks.clear();
    });
  }

  Future onReady(VoidCallback callback) async {
    await _lock.synchronized(() {
      if (_handle != null) {
        callback();
        return;
      }

      _onReadyCallbacks.add(callback);
    });
  }
}