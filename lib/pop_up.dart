import 'package:desafio_grupal_2/enum_type.dart';
import 'package:flutter/material.dart';

import 'pop_up_card.dart';

class PopUp extends StatefulWidget {
  PopUpCardtype state;

  PopUp({
    Key? key,
    required this.state,
    /*this.textok = "Se han guardado los cambios",
    this.textwarning =
        "Esta por abandonar la partida. \n Después puede reanudarla",*/
  }) : super(key: key);
  //final String textok;
  //final String textwarning;
  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  late Color colorpop;
  late Icon icon;
  /*_state(int state) {
    if (state == 0) {
      colorpop = Colors.teal;
      icon = const Icon(Icons.warning_amber, color: Colors.red);
    } else {
      if (state == 1) {
        colorpop = Colors.red;
        icon = const Icon(Icons.check, color: Colors.teal);
      }
    }                            //Logica de mica , con ints
  }*/

  _state(PopUpCardtype state) {
    switch (state) {
      case PopUpCardtype.incorrecto:
        colorpop = Colors.red;
        icon = const Icon(Icons.warning_amber, color: Colors.red);
        return PopUpCard(
          color: colorpop,
          text: "Esta por abandonar la partida. \n Después puede reanudarla",
          icon: icon,
        );
        break;

      case PopUpCardtype.correcto:
        colorpop = Colors.teal;
        icon = const Icon(Icons.check, color: Colors.teal);
        return PopUpCard(
          color: colorpop,
          icon: icon,
        );
        break;
      default:
        break;
    }
  } //Logica de Renso con Switch/Enum

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;

    return _state(widget.state);
  }
}
