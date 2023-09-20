import 'package:flutter/material.dart';

class PrioridadeRow extends StatefulWidget {
  PrioridadeRow(
      {super.key, required this.dropdownValue, required this.onChanged});
  String dropdownValue;
  final void Function(String?) onChanged;

  @override
  State<PrioridadeRow> createState() => _PrioridadeRowState();
}

class _PrioridadeRowState extends State<PrioridadeRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Prioridade: ",
          style: TextStyle(
              fontSize: 15, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(
          width: 10,
        ),
        DropdownButton(
          style: TextStyle(
              fontSize: 15, color: Theme.of(context).colorScheme.primary),
          items: const [
            DropdownMenuItem(
              value: "Baixa",
              child: Text("Baixa"),
            ),
            DropdownMenuItem(
              value: "Media",
              child: Text("Média"),
            ),
            DropdownMenuItem(
              value: "Alta",
              child: Text("Alta"),
            ),
          ],
          onChanged: widget.onChanged,
          value: widget.dropdownValue,
        ),
      ],
    );
  }
}
