import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {

  final bool TaskCompleted;
  final String TaskName;
  Function(BuildContext)? ondelete;

  Function(bool?)? onChanged;

   TodoTile({ Key? key, required this.TaskCompleted, required this.TaskName, required this.onChanged,required this.ondelete }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25,right: 25,top:15),
      child: Slidable(
        endActionPane: ActionPane
        (motion: StretchMotion(), 
        children: [
          SlidableAction(
            onPressed: ondelete,
             icon: Icons.delete,
             backgroundColor: Colors.red,
             borderRadius:BorderRadius.circular(10),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.purple[100],
            borderRadius: BorderRadius.circular(10)
          ),
          child:Row(
            children: [
              Transform.scale(
                scale:1.3,
                child: Checkbox(value: TaskCompleted, onChanged: onChanged)),
              Text(TaskName,
              style: TextStyle(color: Colors.black,fontSize: 20,
              decoration: TaskCompleted ? TextDecoration.lineThrough : TextDecoration.none),),
            ],
          )
        ),
      ),
    );
  }
}