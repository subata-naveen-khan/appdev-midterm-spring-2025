import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midterm_s2025/Obj/obj_model.dart';
import 'package:midterm_s2025/bloc/events.dart';
import 'package:midterm_s2025/bloc/obj_bloc.dart';
import 'package:midterm_s2025/bloc/states.dart';
import 'package:midterm_s2025/Obj/obj_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ObjBloc>().add(LoadObjsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Midterm S2025'),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<ObjBloc, ObjState>(
        builder: (context, state) {
                return ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                final obj = ObjModel(
                  name: 'Object $index',
                  obj: 'Description for object $index',
                );
                return ObjCard(obj: obj);
                },
            );
        },
      ),
    );
  }
}