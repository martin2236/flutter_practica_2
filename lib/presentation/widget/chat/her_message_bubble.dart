import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget{
  final String message;
  final String imageUrl;

  const HerMessageBubble({super.key, required this.message, required this.imageUrl});
  @override
  Widget build(BuildContext context){

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
              decoration: BoxDecoration(
                color:colors.secondary,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:20,vertical:10),
                child: Text(message,style:const TextStyle(color:Colors.white),),
              ),
      ),
      const SizedBox(height: 5),

      _ImageBubble(imagen: imageUrl,),
     const SizedBox(height: 10,)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  
  final String imagen;
  _ImageBubble({required this.imagen});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imagen,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child:const Text('Pamela esta enviando un mensaje'),
          );
        },
        )
      );
  }
}