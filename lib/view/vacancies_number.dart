import 'package:flutter/material.dart';
import '../controller/provider.dart';

///
class VacanciesNumberScreen extends StatelessWidget {
  ///
  VacanciesNumberScreen({Key? key}) : super(key: key);
  TextEditingController _vacanciesController = TextEditingController();

  ///
  TextEditingController get vacanciesController => _vacanciesController;

  set vacanciesController(TextEditingController vacanciesNumber) {
    _vacanciesController = vacanciesNumber;
  }

  //final _formKey = GlobalKey<FormState>();

  /// Valid if the field was filled
  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(217, 240, 250, 1),
          body: Center(
            child: Container(
              color: const Color.fromRGBO(217, 240, 250, 1),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 70),
                    child: TextFormField(
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Insira um número de vagas';
                        }
                        return null;
                      },
                      controller: _vacanciesController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Número de vagas',
                        fillColor: Color.fromRGBO(217, 240, 250, 1),
                        filled: true,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        VacanciesState(int.parse(_vacanciesController.text));
                      },
                      icon: const Icon(Icons.save_sharp)),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 70),
                    child: Text(
                      'Vagas disponíveis:',
                      style: TextStyle(
                          color: Colors.black12,
                          fontSize: 18,
                          leadingDistribution:
                              TextLeadingDistribution.proportional),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 70),
                    child: Text(
                      '0/${_vacanciesController.text}',
                      style: const TextStyle(
                          color: Colors.black12,
                          fontSize: 18,
                          leadingDistribution:
                              TextLeadingDistribution.proportional),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
