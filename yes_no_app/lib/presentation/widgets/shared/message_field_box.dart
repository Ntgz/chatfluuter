import 'package:flutter/material.dart';

class MessageField extends StatelessWidget {
  final ValueChanged<String> onValue;


  const MessageField({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textController= TextEditingController();
    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
          borderSide: BorderSide( color: colors.primary),
          borderRadius: BorderRadius.circular(20) );

    return TextFormField(  
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: InputDecoration(
        hintText: 'End your message with a "??"',
        enabledBorder:outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled:true,
        suffixIcon: IconButton(
          icon: const Icon( Icons.send_outlined ),
          onPressed: () {
            final textValue = textController.value.text;
            onValue(textValue);
            textController.clear();
          },
        )
      ),
      onFieldSubmitted: (value) {
         onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}