import 'package:flutter/material.dart';


class PopUpCard extends StatefulWidget {
  const PopUpCard({Key? key}) : super(key: key);

  @override
  State<PopUpCard> createState() => _PopUpCardState();
}

class _PopUpCardState extends State<PopUpCard> {



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content:(
          PopUpContent()
      )
    );
  }
}

class PopUpContent extends StatelessWidget {
  const PopUpContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,   //agregar propiedad para cambiar fondo de color
          borderRadius: BorderRadius.circular(10),),
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
                    color: Colors.teal,  //agregar propiedad para cambiar color superior
                  ),
                ),
                const Flexible(
                  flex: 3,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(12,25,12,20),
                      child: Text("Se han guardado los cambios", textAlign: TextAlign.center,) // agregar Propiedad para poner texto
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(35, 12, 35, 12),
                    child: ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    },
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Text("Aceptar", textAlign: TextAlign.center),
                        )),
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
                      BoxShadow(color: Colors.black12,blurRadius: 10.0, spreadRadius: 5,offset: Offset(4, 4))
                    ]
                ),
                height: 50,
                width: 50,
                child: Icon(
                  Icons.check,
                  color: Colors.teal,
                  size: 50,                //agregar propiedad para seleccioanr icono
                ),
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
}
