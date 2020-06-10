import 'package:flutter/material.dart';
import 'package:gradient_to_you/app_store.dart';
import 'package:gradient_to_you/common/input_item.dart';
import 'package:gradient_to_you/l10n/l10n.dart';

class MessageBar extends StatefulWidget {
  const MessageBar({
    Key key,
    @required this.store,
  }) : super(key: key);

  @override
  _MessageBarState createState() => _MessageBarState();

  final AppStore store;
}

class _MessageBarState extends State<MessageBar> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.store.message ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final textFieldHeight = MediaQuery.of(context).viewInsets.bottom;
    final isAutofocus = widget.store.message == null;

    return Padding(
      padding: EdgeInsets.only(
        bottom: textFieldHeight,
      ),
      child: InputItem(
        icon: Icon(Icons.message, color: widget.store.baseColor),
        input: TextField(
          controller: _controller,
          autofocus: isAutofocus,
          decoration: InputDecoration(
            labelText: l10n.hintText,
//        hintText: l10n.hintText,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: widget.store.baseColor),
            ),
          ),
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          minLines: 1,
          onChanged: widget.store.setMessage,
        ),
      ),
    );
  }
}

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
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.store.message ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    return TextField(
      controller: _controller,
      autofocus: true,
      decoration: InputDecoration(
        labelText: l10n.hintText,
//        hintText: l10n.hintText,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.store.baseColor),
        ),
      ),
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      minLines: 1,
      onChanged: widget.store.setMessage,
    );
  }
}
