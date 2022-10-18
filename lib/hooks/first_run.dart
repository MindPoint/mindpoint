import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mindpoint/constants/shared_prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

void useAppFirstRunEffect(void Function() cb) {
  useEffect(() {
    SharedPreferences.getInstance().then((prefs) async {
      final bool isFirstRun = prefs.getBool(SHARED_PREF_FIRST_RUN_KEY) ?? false;

      if (!isFirstRun) {
        cb();
        prefs.setBool(SHARED_PREF_FIRST_RUN_KEY, true);
      }
    });

    return null;
  });
}
