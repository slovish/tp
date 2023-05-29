import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'controller/list_controller.dart';

class Alarmcrad extends StatelessWidget {
  final List<String> alarmData;
  final int index;
  const Alarmcrad({
    super.key,
    required this.alarmData,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    listControlller cont = Get.find();

    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.deepOrange[200],
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Alarm$index",
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              alarmData[0] + " : " + alarmData[1] + "  " + alarmData[2],
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Switch(
            onChanged: (value) {},
            activeTrackColor: Colors.orangeAccent[100],
            activeColor: Colors.deepOrange,
            value: true,
          ),
        ],
      ),
    );
  }
}
