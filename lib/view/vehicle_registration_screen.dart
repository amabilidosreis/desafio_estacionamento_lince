import 'package:flutter/material.dart';

/// Form registration
abstract class FormRegistration extends StatelessWidget {
  FormRegistration({Key? key}) : super(key: key);

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
            appBar: AppBar(
              title: const Text('Cadastre um novo carro'),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
            )));
  }
}
