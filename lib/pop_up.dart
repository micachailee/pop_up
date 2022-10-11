import 'package:desafio_grupal_2/custom_button.dart';
import 'package:desafio_grupal_2/enum_type.dart';
import 'package:flutter/material.dart';

class PopUp extends StatefulWidget {
  PopUpCardtype state;
  PopUp({
    Key? key,
    required this.state,
  }) : super(key: key);
  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  late Color color;
  late Icon icon;
  late String text;
  late String buttonText;
  late Color buttonColor;
  _state(PopUpCardtype state) {
    switch (state) {
      case PopUpCardtype.incorrecto:
        color = Colors.red;
        icon = const Icon(Icons.warning_amber, color: Colors.red);
        text = "Esta por abandonar la partida. \n Después puede reanudarla";
        buttonText = "Entendido";
        buttonColor = Colors.red;
        break;

      case PopUpCardtype.correcto:
        color = Colors.teal;
        icon = const Icon(Icons.check, color: Colors.teal);
        text = "Se han guardado los cambios";
        buttonText = "Aceptar";
        buttonColor = Colors.teal;
        break;
      default:
        break;
    }
    return _PopUpCard(color, icon, text, buttonText, buttonColor, context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;

    return _state(widget.state);
  }
}
//OTRO ARCHIVO

_PopUpCard(Color color, Icon icon, String text, String buttonText, Color buttonColor, context) {
  return AlertDialog(
    elevation: 0,
    backgroundColor: Colors.transparent,
    content: (_PopUpContent(color, text, icon, buttonText, buttonColor, context)),
  );
}

_PopUpContent(Color color, String text, Icon icon, String buttonText, Color buttonColor, context) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  height: 50,
                  color: color,
                ),
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 25, 12, 20),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(35, 12, 35, 12),
                  child: CustomButton(
                    text: buttonText,
                    backgroundColor: buttonColor,
                    onTap: () {
                Navigator.pop(context);
                },

                      ),
                ),
              )
            ],
          ),
          Positioned(
            top: 20,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        spreadRadius: 5,
                        offset: Offset(4, 4))
                  ]),
              height: 50,
              width: 50,
              child: icon,
            ),
          ),
          const Positioned(
              right: -5,
              top: 1,
              child: CloseButton(
                color: Colors.white,
              ))
        ],
      ),
    ),
  );
}
