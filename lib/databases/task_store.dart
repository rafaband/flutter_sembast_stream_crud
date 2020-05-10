import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_task_crud/databases/local_database.dart';
import 'package:sembast_task_crud/models/tassk.dart';

class TaskStore {
  static const String _STORE_NAME = "task";

  final _store = intMapStoreFactory.store(_STORE_NAME);
  Future<Database> get _db async => await LocalDatabase.instance.database;

  save(Task entity) async {
    debugPrint("SAVING $entity");
    await _store.add(await _db, entity.toJson());
  }

  update(Task entity) async {
    debugPrint("UPDATING $entity");
    final finder = Finder(filter: Filter.byKey(entity.key));
    await _store.update(await _db, entity.toJson(), finder: finder);
  }

  delete(Task entity) async {
    debugPrint("DELETING $entity");
    final finder = Finder(filter: Filter.byKey(entity.key));
    await _store.delete(await _db, finder: finder);
  }

  Future<Stream<List<Task>>> stream() async {
    debugPrint("Geting Data Stream");
    var streamTransformer = StreamTransformer<
        List<RecordSnapshot<int, Map<String, dynamic>>>,
        List<Task>>.fromHandlers(
      handleData: _streamTransformerHandlerData,
    );

    return _store
        .query()
        .onSnapshots(await _db)
        .transform(streamTransformer);
  }

  Future<List<Task>> findAll() async {
    final snapshot = await _store.find(await _db);
    return snapshot.map((e) => Task.fromDatabase(e)).toList();
  }

  _streamTransformerHandlerData(
      List<RecordSnapshot<int, Map<String, dynamic>>> snapshotList,
      EventSink<List<Task>> sink) {
    List<Task> resultSet = [];
    snapshotList.forEach((element) {
      resultSet.add(Task.fromDatabase(element));
    });
    sink.add(resultSet);
  }
}
