import 'package:flutter/material.dart';
import 'package:gradient_to_you/l10n/l10n.dart';

import '../../app_store.dart';

class MessageTextField extends StatefulWidget {
  const MessageTextField({
    Key key,
    @required this.store,
  }) : super(key: key);

  @override
  _MessageTextFieldState createState() => _MessageTextFieldState();
  final AppStore store;
}

class _MessageTextFieldState extends State<MessageTextField> {

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final _textEditingController =
        TextEditingController(text: widget.store.message ?? '');

    return TextField(
      controller: _textEditingController,
      decoration: InputDecoration(
        labelText: '',
        hintText: l10n.hintText,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.store.baseColor),
        ),
      ),
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      onChanged: widget.store.setMessage,
    );
  }
}
