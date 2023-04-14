import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateTarefas extends StatefulWidget {
  const UpdateTarefas(
      {super.key, required this.acao, required this.status, required this.id});
  final String acao;
  final bool status;
  final String id;

  @override
  State<UpdateTarefas> createState() => _UpdateTarefasState();
}

class _UpdateTarefasState extends State<UpdateTarefas> {
  final acaoTxt = TextEditingController();
  late bool? status;

  @override
  void initState() {
    super.initState();
    acaoTxt.text = widget.acao;
    status = widget.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atualizar Tarefa"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Tarefa..."),
              controller: acaoTxt,
            ),
            SizedBox(
              width: double.infinity,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Tarefa Concluída?"),
                    Checkbox(
                        value: status,
                        onChanged: (bool? newValue) {
                          setState(() {
                            status = newValue;
                          });
                        })
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Atualizar"),
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection("tarefas")
                      .doc(widget.id)
                      .update({"acao": acaoTxt.text, "status": status});

                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
