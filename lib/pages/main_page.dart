// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_list/pages/registration_page.dart';
import 'package:todo_list/pages/tarefas_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: Theme.of(context).colorScheme.primary,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(
              Icons.app_registration_rounded,
            ),
            label: "Cadastro",
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt_rounded),
            label: "Tarefas",
          ),
        ],
      ),
      body: <Widget>[
        RegistrationPage(),
        TarefasPage(),
      ][currentPageIndex],
    );
  }
}
