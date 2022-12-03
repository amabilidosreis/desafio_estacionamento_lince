import 'package:desafio_lince_tech_academy/view/vehicle_registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StayList extends StatelessWidget {

  ///
  const StayList({Key? key})
      : super(key: key);

  Date() {
    var format = DateFormat('yyyy-MM-dd HH:mm:ss');
    var entryDate = format.format(DateTime.now());

    return entryDate.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
            height: 32,
            width: 52,
            child: IconButton(onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (contextNew) => FormRegistration()));}, icon: Icon(Icons.add))),
      ]),
    );
  }
}
