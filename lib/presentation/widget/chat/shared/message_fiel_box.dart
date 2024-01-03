import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  //en vez de llamar al metodo de chatProvider sendMessage se puede configurar al widget
  // para recibir una funcion y que no dependa directamente del provider haciendo que sea
  // posible utilizarlo en otros lugares
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key,required this.onValue});

  @override
  Widget build(BuildContext context) {
    //final colors = Theme.of(context).colorScheme;
    final textController = TextEditingController();

    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide:const BorderSide(color: Colors.transparent),
      borderRadius:BorderRadius.circular(20)
    );

    final inputDecoration = InputDecoration(
        hintText: 'Termina tu mensaje con ?',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled:true,
        suffixIcon:  IconButton(
          onPressed: (){
          final textValue = textController.value.text;

            onValue(textValue);
            textController.clear();
        }, 
        icon: const Icon(Icons.send_outlined))
      );

    return  TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}