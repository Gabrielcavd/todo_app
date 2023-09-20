import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/pages/tarefas_detail_page.dart';
import 'package:todo_list/models/tarefa.dart';
import 'data/tarefas_list.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

int calculateDifference(DateTime date) {
  DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}

Widget getBody() {
  return StatefulBuilder(
    builder: (context, setState) {
      if (tarefasList.isEmpty) {
        return const Center(
          child: Text("Nenhuma tarefa cadastrada"),
        );
      } else {
        return ListView.builder(
          itemCount: tarefasList.length,
          itemBuilder: (BuildContext context, int index) {
            final tarefa = tarefasList[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TarefasDetailPage(
                        tarefa: tarefa,
                      );
                    },
                  ),
                ).then((value) => setState(() {}));
              },
              child: Slidable(
                key: UniqueKey(),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      onPressed: (context) {
                        setState(() {
                          tarefasList.removeAt(index);
                        });
                      },
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Color(0xFF21B7CA),
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: 'Editar',
                    ),
                  ],
                ),
                child: Card(
                  color: getCardColor(tarefa),
                  child: ListTile(
                    title: Text(tarefa.titulo),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('dd/MM/yyyy').format(tarefa.data),
                        ),
                        Text(
                          'Prioridade ${tarefa.prioridade}',
                          style: TextStyle(
                            color: getPriorityColor(tarefa),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_right_rounded),
                  ),
                ),
              ),
            );
          },
        );
      }
    },
  );
}

Color getCardColor(Tarefa tarefa) {
  if (calculateDifference(tarefa.data) < 0) {
    return Colors.red.shade100;
  } else if (calculateDifference(tarefa.data) == 0) {
    return Colors.green.shade100;
  } else {
    return const Color.fromARGB(255, 244, 249, 254);
  }
}

Color getPriorityColor(Tarefa tarefa) {
  switch (tarefa.prioridade) {
    case "Baixa":
      return Colors.green.shade500;
    case "Media":
      return const Color.fromARGB(255, 190, 141, 17);
    case "Alta":
      return Colors.red.shade500;
    default:
      return Colors.black;
  }
}
