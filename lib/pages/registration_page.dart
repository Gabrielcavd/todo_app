import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/components/my_textField.dart';
import 'package:todo_list/components/prioridade_row.dart';
import 'package:todo_list/data/tarefas_list.dart';
import 'package:todo_list/models/tarefa.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String dropdownValue = "Baixa";
  String dateButtonTitle = "Definir data";
  void onChanged(String? newValue) {
    setState(() {
      dropdownValue = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastre sua Tarefa"),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyTextField(controlador: titleController, label: "Título"),
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                    controlador: descriptionController,
                    label: "Descrição",
                    minLines: 3,
                    maxLines: 6),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrioridadeRow(
                        dropdownValue: dropdownValue, onChanged: onChanged),
                    ElevatedButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025),
                        ).then((value) {
                          if (value != null) {
                            setState(() {
                              dateButtonTitle =
                                  DateFormat('dd/MM/yyyy').format(value);
                            });
                          }
                        });
                      },
                      child: Text(dateButtonTitle),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    final isValidForm = formKey.currentState!.validate();
                    if (isValidForm) {
                      Tarefa novaTarefa = Tarefa(
                        id: '01',
                        titulo: titleController.text,
                        data: dateButtonTitle == "Definir data"
                            ? DateTime.now()
                            : DateFormat('dd/MM/yyyy').parse(dateButtonTitle),
                        descricao: descriptionController.text,
                        prioridade: dropdownValue,
                      );
                      tarefasList.add(novaTarefa);
                      titleController.clear();
                      descriptionController.clear();
                    }
                  },
                  child: Text("Cadastrar Tarefa"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
