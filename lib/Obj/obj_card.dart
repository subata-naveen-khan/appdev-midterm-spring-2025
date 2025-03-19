import 'package:flutter/material.dart';
import 'package:midterm_s2025/Obj/obj_model.dart';

class ObjCard extends StatefulWidget {
  const ObjCard({
    super.key,
    required this.obj,
  });

  final ObjModel obj;

  @override
  _ObjCardState createState() => _ObjCardState();
}

class _ObjCardState extends State<ObjCard> {
  // bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(widget.obj.name ?? 'Default Name'),
          Text(widget.obj.obj),
        ],
      )
      // margin: const EdgeInsets.all(10),
      // child: Column(
      //   children: <Widget>[
      //     ListTile(
      //       title: Text(widget.obj.name),
      //       subtitle: Text(widget.obj.description),
      //       trailing: IconButton(
      //         icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
      //         onPressed: () {
      //           setState(() {
      //             isExpanded = !isExpanded;
      //           });
      //         },
      //       ),
      //     ),
      //     if (isExpanded)
      //       Padding(
      //         padding: const EdgeInsets.all(16),
      //         child: Text(widget.obj.description),
      //       ),
      //   ],
      // ),
    );
  }
}