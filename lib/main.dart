import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midterm_s2025/bloc/obj_bloc.dart';
import 'package:midterm_s2025/homepage.dart';
import 'package:midterm_s2025/Obj/obj_repo.dart';

void main() {
  final ObjRepo objRepo = ObjRepo();
  final ObjBloc objBloc = ObjBloc(objRepo: objRepo);
  
  runApp(
  MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => objBloc),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Midterm S2025',
      home: HomePage(),
    );
  }
}
