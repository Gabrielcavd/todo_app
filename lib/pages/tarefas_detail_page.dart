import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/data/tarefas_list.dart';
import 'package:todo_list/utils.dart';

import '../models/tarefa.dart';

class TarefasDetailPage extends StatelessWidget {
  const TarefasDetailPage({super.key, required this.tarefa});
  final Tarefa tarefa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              tarefasList.remove(tarefa);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Detalhes da Tarefa"),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          width: 350,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Column(
            children: [
              Text(
                tarefa.titulo,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Prioridade: ${tarefa.prioridade}',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: getPriorityColor(tarefa)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(tarefa.data),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                tarefa.descricao,
                style: TextStyle(
                    fontSize: 13, color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
