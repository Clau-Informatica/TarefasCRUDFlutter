import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tarefas_firebase/Screens/tela_inicial.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyDULDAh1JaUIlb3CFP94eRczq9QUcD8r4Q',
        appId: '3KjPkejKfLLoAO08U01Y',
        messagingSenderId: '6600162993',
        projectId: 'projetotarefasudemy-8c7c4'),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaInicial(),
    );
  }
}
