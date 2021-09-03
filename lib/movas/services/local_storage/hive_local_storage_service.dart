import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/rxdart.dart';

import 'local_storage_service.dart';

class HiveLocalStorageService extends LocalStorageService {
  late Box? box;

  final String boxName = 'localBox';

  //Injected publish subject
  final PublishSubject<LocalStorageUpdate> localStorageUpdate$;

  HiveLocalStorageService(this.localStorageUpdate$);

  @override
  Future<void> init() async {
    await Hive.initFlutter();

    box = await Hive.openBox(boxName);
    return Future(() {});
  }

  @override
  Future<List<String>> getListForKey(String key) async {
    if (box == null) box = await Hive.openBox(boxName);
    return box!.get(key);
  }

  @override
  Future<String> getValueForKey(String key) async {
    if (box == null) box = await Hive.openBox(boxName);
    var value = box!.get(key);
    if (value is String || value == null) {
      return value;
    } else {
      throw "Value is of wrong type";
    }
  }

  @override
  Future<void> removeValueForKey(String key) async {
    if (box == null) box = await Hive.openBox(boxName);
    try {
      return await box!.delete(key);
    } catch (e) {
      return;
    }
  }

  @override
  Future<void> resetAll() async {
    if (box == null) box = await Hive.openBox(boxName);
    await box!.clear();
  }

  @override
  Future<void> saveListForKey(String key, {List<String>? values}) async {
    if (box == null) box = await Hive.openBox(boxName);
    return await box!.put(key, values);
  }

  @override
  Future<void> saveValueForKey(String key, {String? value}) async {
    if (box == null) box = await Hive.openBox(boxName);
    return await box!.put(key, value);
  }

  @override
  Future<void> dispose() async {
    localStorageUpdate$.close();
  }

  @override
  Future<void> notifyUpdateForKey(String key) async {
    localStorageUpdate$.add(LocalStorageUpdate(key: key));
  }
}
