import 'package:flutter/material.dart';
class PopUp extends StatefulWidget {
  const PopUp({Key? key,
    required this.state,
  }) : super(key: key);

  final int state;

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  Color? colorpop;
  Icon? icon;
  String? text;
  _state(int state){
    if (state == 0)
      {
        colorpop = Colors.teal;
        icon = const Icon(Icons.warning_amber,color: Colors.red);
        text = "Se han guardado los cambios";
      }
    else{
      if(state==1)
        {
          colorpop = Colors.red;
          icon = const Icon(Icons.check,color: Colors.teal);
          text = "Esta por abandonar la partida. \n Después puede reanudarla";
        }
    }
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height/3 ;
    int state = widget.state;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: height,
        width: height*1.2,
        child: Stack(),
      ),
    );
  }
}
