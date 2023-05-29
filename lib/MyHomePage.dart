import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Alarmcrad.dart';
import 'controller/list_controller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    listControlller controlller = Get.put(listControlller());

    TextEditingController hourController = new TextEditingController();
    TextEditingController minuteController = new TextEditingController();
    bool _isam = true;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepOrange[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Alarm ",
          style: TextStyle(color: Colors.deepOrange[100]),
        ),
      ),
      body: Stack(
        children: [
          Obx(() {
            return Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 100),
              child: ListView.builder(
                  itemCount: controlller.Alarms.value.length,
                  itemBuilder: (context, index) {
                    return Alarmcrad(
                      alarmData: controlller.Alarms.value.keys.elementAt(index),
                      index: index,
                    );
                  }),
            );
          }),
          Positioned(
            top: 0,
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.deepOrange[200],
                  borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width - 40,
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text("H"),
                  SizedBox(
                    width: 60,
                    height: 30,
                    child: TextFormField(
                      controller: hourController,
                    ),
                  ),
                  Text("M"),
                  SizedBox(
                    width: 60,
                    height: 30,
                    child: TextFormField(
                      controller: minuteController,
                    ),
                  ),
                  Switch(
                    value: _isam,
                    onChanged: (context) => {_isam = !_isam},
                    activeColor: Colors.deepOrange,
                    activeTrackColor: Colors.deepOrange,
                    inactiveTrackColor: Colors.deepOrange[100],
                  ),
                  IconButton(
                      onPressed: () {
                        controlller.addAlarm(hourController.text,
                            minuteController.text, _isam ? "AM" : "PM");
                        hourController.clear();
                        minuteController.clear();
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.deepOrange[900],
                        size: 30,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
