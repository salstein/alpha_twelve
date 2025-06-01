import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'local_storage_service.dart';

abstract interface class LocalStorageInterface {
  

  Future<String> get launchState;

  Future<void> setLaunchState(String state);


}

final localStorageServiceProvider =
    Provider.autoDispose<LocalStorageInterface>((ref) {
  return LocalStorageService();
});
