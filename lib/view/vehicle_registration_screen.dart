import 'package:flutter/material.dart';
import 'package:desafio_lince_tech_academy/view/stay_list_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../controller/provider.dart';
import '../model/car.dart';
import 'initial_screen.dart';

/// Form registration
class FormRegistration extends StatelessWidget {
  FormRegistration({Key? key}) : super(key: key);

  final cardBoard = TextEditingController();
  TextEditingController _driversName = TextEditingController();
  TextEditingController _licensePlate = TextEditingController();

  /// Valid if the field was filled
  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VacanciesState>(
      builder: (context, state, child) {
        return Form(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Cadastre um novo carro'),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: TextFormField(
                        controller: _driversName,
                        decoration: const InputDecoration(
                            hintText: 'Nome do motorista'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: TextFormField(
                        controller: _licensePlate,
                        decoration:
                        const InputDecoration(hintText: 'Placa do carro'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Container(
                        width: 152,
                        height: 32,
                        child: ElevatedButton(onPressed: (){
                          state.imagePicker(cardBoard.text.toString());
                        }, child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                            ),
                            Text(
                              'Selecione uma foto da galeria'
                            ),
                          ],
                        )
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: ElevatedButton(
                        onPressed: () async {
                          final format = DateFormat('dd-mm-yyyy HH:mm');
                          final entryDate = format.format(DateTime.now());
                          await state.addItem(
                            Car(
                             licensePlate: _licensePlate.text,
                              driverName: _driversName.text,
                              entryFormat: entryDate.toString(),
                              photo: cardBoard.toString(),
                            ),
                          );
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StayList(),
                            ),
                          );
                        },
                        child: Text('Cadastrar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
