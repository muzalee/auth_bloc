import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/storage_item.dart';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  Future<void> setData(StorageItem item) async {
    log('Storage Service: Writing new data with key (${item.key}) and value ${item.value}');
    await _secureStorage.write(key: item.key, value: item.value, aOptions: _getAndroidOptions());
  }

  Future<String?> getData(String key) async {
    log("Storage Service: Reading data with key ($key)");
    String? readData = await _secureStorage.read(key: key, aOptions: _getAndroidOptions());
    return readData;
  }

  Future<void> deleteData(String key) async {
    log('Storage Service: Delete new data with key ($key)');
    await _secureStorage.delete(key: key, aOptions: _getAndroidOptions());
  }

  Future<bool> containsKeyInData(String key) async {
    log('Storage Service: Check data for key ($key)');
    bool containsKey = await _secureStorage.containsKey(key: key, aOptions: _getAndroidOptions());
    return containsKey;
  }

  Future<List<StorageItem>> getAllData() async {
    log('Storage Service: Read all data');
    Map<String, dynamic> allData = await _secureStorage.readAll(aOptions: _getAndroidOptions());
    List<StorageItem> list = allData.entries.map((e) => StorageItem(e.key, e.value)).toList();
    return list;
  }

  Future<void> deleteAllData() async {
    log('Storage Service: Delete all data');
    await _secureStorage.deleteAll(aOptions: _getAndroidOptions());
  }
}