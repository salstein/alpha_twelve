import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_interface.dart';

final class LocalStorageService implements LocalStorageInterface {
  Future<SharedPreferences> get _prefsInstance async =>
      await SharedPreferences.getInstance();

  static const _launchStateKey = 'launch_state';

  @override
  Future<String> get launchState async {
    return (await _prefsInstance).getString(_launchStateKey) ?? '';
  }

  @override
  Future<void> setLaunchState(String state) async {
    (await _prefsInstance).setString(_launchStateKey, state);
  }
}
