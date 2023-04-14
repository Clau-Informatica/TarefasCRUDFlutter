import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddTarefas extends StatelessWidget {
  const AddTarefas({super.key});

  @override
  Widget build(BuildContext context) {
    final acaoTxt = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Tarefa"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Digite a nova tarefa..."),
              controller: acaoTxt,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection("tarefas")
                        .add({"acao": acaoTxt.text, "status": false});
                    Navigator.pop(context);
                  },
                  child: Text("Salvar")),
            )
          ],
        ),
      ),
    );
  }
}
