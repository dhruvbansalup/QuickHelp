import 'package:get_storage/get_storage.dart';

class QLocalStorage {
  // Singleton instance - to ensure only one instance of the class exists
  static final QLocalStorage _instance = QLocalStorage._internal();

  // Private constructor
  factory QLocalStorage() {
    return _instance;
  }

  QLocalStorage._internal(); // Private constructor to prevent instantiation

  final _storage = GetStorage(); // Instance of GetStorage

  // Method to save data to local storage
  Future<void> saveData(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  // Method to read data from local storage
  dynamic readData(String key) {
    return _storage.read(key);
  }
  // Method remove data from local storage
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }
  // Method to clear all data from local storage
  Future<void> clearAll() async {
    await _storage.erase();
  }

}
