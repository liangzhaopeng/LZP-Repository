// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
import 'package:event_bus/event_bus.dart';

class SpUtil {

  static SharedPreferences? preferences;


  static Future getInstance() async {
    preferences = await SharedPreferences.getInstance();
  }
}

EventBus eventBus = EventBus();