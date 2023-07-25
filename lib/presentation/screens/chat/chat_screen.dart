import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBarView(),
      body: _ChatView(),
    );
  }
}

class _AppBarView extends AppBar {
  _AppBarView()
      : super(
          leading: const Padding(
            // Espacio antes del titulo
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.stylist.co.uk/images/app/uploads/2022/06/01105352/jennifer-aniston-crop-1654077521-1390x1390.jpg?w=256&h=256&fit=max&auto=format%2Ccompress'),
            ),
          ),
          title: const Text('Jennifer Aniston'),
          centerTitle: false,
        );
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // SafeArea: Desplegar contenido en el cuerpo del dispositivo evita poner widgets en zonas reservadas del dispositivo
      child: Padding(
        // Crear Padding
        padding: const EdgeInsets.symmetric(
            horizontal: 10), // Asignar padding a los lados de igual config
        child: Column(
          // Columna iterar widgets hacia abajo
          children: [
            Expanded(
              // expandir widget a mayor cantidad del dispositivo
              child: ListView.builder(
                itemCount: 100, // Cantidad de items a desplegar
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                      ? const HerMessageBubble()
                      : const MyMessageBubble();
                },
              ), // builder solo crea en el UI los elementos a mostrar
            ),

            /// Caja de texto de mensajes
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
