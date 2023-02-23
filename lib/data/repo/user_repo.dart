import 'package:auth_bloc/data/models/storage_item.dart';
import 'package:auth_bloc/utils/const/storage_const.dart';

import '../services/storage_service.dart';

class UserRepo {
  Future<String?> getToken() async {
    return StorageService().getData(StorageConst.token);
  }

  Future<void> setToken(String val) async {
    await StorageService().setData(StorageItem(StorageConst.token, val));
  }

  Future<void> deleteToken() async {
    await StorageService().deleteData(StorageConst.token);
  }

  Future<String?> getName() async {
    return StorageService().getData(StorageConst.userName);
  }

  Future<void> setName(String val) async {
    await StorageService().setData(StorageItem(StorageConst.userName, val));
  }

  Future<void> deleteName() async {
    await StorageService().deleteData(StorageConst.userName);
  }
}
