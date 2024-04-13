import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {


  final Message messages;


  const MyMessageBubble({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
      Container(
      
        decoration: BoxDecoration(
          color:colors.primary,
          borderRadius: BorderRadius.circular(20)
        ),
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical:10),
          child: Text(messages.text, style: const TextStyle(color: Colors.white),),
        )
      ),
      const SizedBox(height: 10)
    ],
    
    
    );
  }
}