import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/provider.dart';
import 'vehicle_registration_screen.dart';

class StayList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<VacanciesState>(
      builder: (context, state, child) {
        return Material(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contextNew) => FormRegistration(),
                  ),
                );
              },
              child: Icon(Icons.add)
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.cars.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Row(
                            children: [Container(
                              width: 32,
                              height: 52,
                              color: Color.fromRGBO(186, 225, 227, 0.89),
                              child:
                                ElevatedButton(
                                  onLongPress:
                                    color: Color.red,
                                  , child: Icon(
                                  Icons.photo,
                                ),
                                )
                            ),
                              Text(
                                '${state.cars[index].driverName}'
                                    ' ${state.cars[index].licensePlate}'
                                    ' ${state.cars[index].entryFormat}',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
