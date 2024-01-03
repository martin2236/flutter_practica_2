
//podemos instanciar una clase para modelar los datos recividos del backend
//esto nos permite tener control de las propiedades y poder asegurarnos que 
//existan mediante el uso de asserts, otra de las ventajas es que nos permite 
// usar la notacion de puntos

import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'si' : answer == 'maybe' ? 'talvez' : 'no', 
      fromWho: FromWho.hers,
      imageUrl: image
      );
      
}