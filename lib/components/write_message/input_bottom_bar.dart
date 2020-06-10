import 'dart:async';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:gradient_to_you/l10n/l10n.dart';

import '../../app_store.dart';
import 'input_bottom_bar/font_bar.dart';
import 'input_bottom_bar/message_bar.dart';
import 'input_bottom_bar/size_bar.dart';

class InputBottomBar extends StatefulWidget {
  const InputBottomBar({
    Key key,
    @required this.store,
    @required this.l10n,
  }) : super(key: key);

  @override
  _InputBottomBarState createState() => _InputBottomBarState();

  final AppStore store;
  final L10n l10n;
}

class _InputBottomBarState extends State<InputBottomBar> {
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    if (widget.store.message == null) {
      Timer.run(() {
        _showInputBottomBar(0);
      });
    }
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
          return MessageBar(store: widget.store);
        }
        break;

      case 1:
        {
          return SizeBar(store: widget.store);
        }
        break;

      case 2:
        {
          return FontBar(
            store: widget.store,
          );
        }
        break;
    }
    return null;
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        {
          return widget.l10n.bottomBarTitleMessage;
        }
        break;

      case 1:
        {
          return widget.l10n.bottomBarTitleSize;
        }
        break;

      case 2:
        {
          return widget.l10n.bottomBarTitleFormat;
        }
        break;
    }
    return null;
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
    }
    return null;
  }
}
