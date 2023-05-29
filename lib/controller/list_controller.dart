import 'package:get/get.dart';

class listControlller {
  RxMap<List<String>, bool> _alarms = {
    ["10", "30", "AM", ]: true,
    ["7", "45", "PM"]: false,
  }.obs;

  RxMap<List<String>, dynamic> get Alarms => _alarms;

  void addAlarm(String hour, String min, String amOrPm) {
    _alarms.addAll({[hour, min, amOrPm]: true});
  }

  // void removeAlarm(int index) {
  //   _alarms.remove(index);
  // }
}
