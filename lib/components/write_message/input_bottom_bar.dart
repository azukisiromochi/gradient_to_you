import 'dart:async';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gradient_to_you/components/write_message/font_color_picker.dart';

import '../../app_store.dart';
import 'font_family_dropdown.dart';
import 'font_size_slider.dart';
import 'message_text_field.dart';

class InputBottomBar extends StatefulWidget {
  const InputBottomBar({
    Key key,
    @required this.store,
  }) : super(key: key);

  @override
  _InputBottomBarState createState() => _InputBottomBarState();
  final AppStore store;
}

class _InputBottomBarState extends State<InputBottomBar> {
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    Timer.run(() {
      _showInputBottomBar(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BubbleBottomBar(
      opacity: .2,
      currentIndex: _currentIndex,
      onTap: _changeBar,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      elevation: 8,
      fabLocation: BubbleBottomBarFabLocation.end,
      hasNotch: true,
      hasInk: true,
      inkColor: Colors.black12,
      items: List.generate(
        3,
        _makeBottomBarItem,
      ),
    );
  }

  void _changeBar(int index) {
    _showInputBottomBar(index);
    setState(() {
      _currentIndex = index;
    });
  }

  void _showInputBottomBar(int index) {
    showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: _getInputItem(index),
              ),
              const SizedBox(height: 30),
              Container(
                color: widget.store.baseColor.withOpacity(0.2),
                child: ListTile(
                  leading: Icon(
                    Icons.arrow_downward,
                    color: widget.store.baseColor,
                  ),
                  title: Text(
                    _getTitle(index),
                    style: TextStyle(color: widget.store.baseColor),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  BubbleBottomBarItem _makeBottomBarItem(int index) {
    final icon = _getIconData(index);
    return BubbleBottomBarItem(
      backgroundColor: widget.store.baseColor,
      icon: Icon(
        icon,
        color: widget.store.baseTextColor,
      ),
      activeIcon: Icon(
        icon,
        color: widget.store.baseColor,
      ),
      title: Text(_getTitle(index)),
    );
  }

  Widget _getInputItem(int index) {
    switch (index) {
      case 0:
        {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: _InputItem(
              icon: Icon(Icons.message, color: widget.store.baseColor),
              input: MessageTextField(store: widget.store),
            ),
          );
        }
        break;

      case 1:
        {
          return _InputItem(
            icon: Icon(Icons.format_size, color: widget.store.baseColor),
            input: FontSizeSlider(store: widget.store),
          );
        }
        break;

      case 2:
        {
          return Column(children: <Widget>[
            _InputItem(
              icon: Icon(Icons.text_format, color: widget.store.baseColor),
              input: FontFamilyDropdown(store: widget.store),
            ),
            const SizedBox(height: 10),
            _InputItem(
              icon: Icon(Icons.color_lens, color: widget.store.baseColor),
              input: FontColorPicker(store: widget.store),
            ),
          ]);
        }
        break;

      default:
        {
          return const Placeholder();
        }
        break;
    }
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        {
          return 'Message';
        }
        break;

      case 1:
        {
          return 'Size';
        }
        break;

      case 2:
        {
          return 'Format';
        }
        break;

      default:
        {
          return 'Message';
        }
        break;
    }
  }

  IconData _getIconData(int index) {
    switch (index) {
      case 0:
        {
          return Icons.message;
        }
        break;

      case 1:
        {
          return Icons.format_size;
        }
        break;

      case 2:
        {
          return Icons.text_format;
        }
        break;

      default:
        {
          return Icons.message;
        }
        break;
    }
  }
}

class _InputItem extends StatelessWidget {
  const _InputItem({
    Key key,
    @required this.icon,
    @required this.input,
  }) : super(key: key);

  final Icon icon;
  final Widget input;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: icon,
        ),
        Expanded(
          flex: 4,
          child: Container(child: input),
        ),
      ],
    );
  }
}
