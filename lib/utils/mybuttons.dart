import 'package:flutter/material.dart';

class Mybuttons extends StatefulWidget {

final String text;
VoidCallback onPressed;


  Mybuttons({ Key? key, required this.text,required this.onPressed}) : super(key: key);

  @override
  _MybuttonsState createState() => _MybuttonsState();
}

class _MybuttonsState extends State<Mybuttons> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.purple,
      onPressed: widget.onPressed,
      child: Text(widget.text,style: TextStyle(color: Colors.white),) ,
      
    );
  }
}