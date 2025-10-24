import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget
{
  final Function(String) onSend;
  const MessageFieldBox({super.key, required this.onSend});

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends State<MessageFieldBox> {
  @override
  Widget build(BuildContext context)
  {
    final TextEditingController textController = TextEditingController();
    final FocusNode focusNode = FocusNode();
    final colors = Theme.of(context).colorScheme;

    return TextFormField
    (
      controller: textController,
      focusNode: focusNode,
      decoration: _customInputDecoration
      (
        colors: colors,
        onSend: ()
        {
          final textValue = textController.value.text;
          if(textValue.isNotEmpty)
          {
            widget.onSend(textValue);
            textController.clear();
            focusNode.requestFocus();
          }
        },
      ),
      onTapOutside: (event)
      {
        print('Quiero saber que haces $event');
        focusNode.unfocus();
      },
      onFieldSubmitted: (value)
      {
        print('Aquí push enter locochon porque despues se enojan $value');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }

  InputDecoration _customInputDecoration
  ({required ColorScheme colors, required VoidCallback onSend,}) 
  => InputDecoration
  (
    enabledBorder: _customOutlineInputBorder(colors.primary),
    focusedBorder: _customOutlineInputBorder(colors.primaryContainer),
    hintText: 'Envía tu pregunta: ',
    suffixIcon: IconButton(onPressed: onSend, icon: const Icon(Icons.send)),
  );

  OutlineInputBorder _customOutlineInputBorder(Color color) => OutlineInputBorder
  (
    borderSide: BorderSide(color: color),
    borderRadius: BorderRadius.circular(20),
  );
}