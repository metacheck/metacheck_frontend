abstract class LocalStorageService {
  Future<void> init();

  Future<String> getValueForKey(String key);

  Future<void> saveValueForKey(String key, {String? value});

  Future<List<String>> getListForKey(String key);

  Future<void> notifyUpdateForKey(String key);

  Future<void> saveListForKey(String key, {List<String>? values});

  Future<void> removeValueForKey(String key);

  Future<void> resetAll();

  dispose() {}
}

class LocalStorageUpdate {
  final String key;

  const LocalStorageUpdate({
    required this.key,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalStorageUpdate &&
          runtimeType == other.runtimeType &&
          key == other.key;

  @override
  int get hashCode => key.hashCode;
}
