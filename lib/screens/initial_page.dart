import 'package:flutter/material.dart';
import 'package:organizador_de_tarefas/components/task.dart';
import 'package:organizador_de_tarefas/screens/form_screen.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
      ),
      body: ListView(
        children: const [
          Task(
            nome: 'Aprender a andar de bike',
            image: 'assets/images/bike.jpg',
            dificuldade: 4,
          ),
          Task(
            nome: 'Aprender flutter',
            image: 'assets/images/flutter.png',
            dificuldade: 3,
          ),
          Task(
            nome: 'Jogar',
            image: 'assets/images/cs2.png',
            dificuldade: 1,
          ),
          Task(
            nome: 'Dar role de golzão',
            image:
                'assets/images/gol-2001-aro-18-rebaixado-prata-rodas-amarok.webp',
            dificuldade: 0,
          ),
          Task(
            nome: 'Meditar',
            image: 'assets/images/meditacao-praia.jpg',
            dificuldade: 5,
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const FormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
