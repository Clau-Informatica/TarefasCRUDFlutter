import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Screens/update_tarefas.dart';

class TarefaItem extends StatelessWidget {
  const TarefaItem(
      {super.key, required this.title, required this.status, required this.id});
  final String title;
  final bool status;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        child: Row(
          children: [
            Expanded(
                child: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.blue),
            )),
            Expanded(
                child: status
                    ? Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.browse_gallery_rounded,
                        color: Colors.red,
                      ))
          ],
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => UpdateTarefas(
                        acao: title,
                        status: status,
                        id: id,
                      ))));
        },
        onLongPress: () async {
          await FirebaseFirestore.instance
              .collection("tarefas")
              .doc(id)
              .delete();
        },
      ),
    );
  }
}
