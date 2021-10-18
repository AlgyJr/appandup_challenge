import 'dart:ui';

import 'package:flutter/material.dart';

class CircleBordersButton extends StatefulWidget {
  const CircleBordersButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Function onTap;

  @override
  State<CircleBordersButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<CircleBordersButton> {
  bool isDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      onTapDown: (_) {
        setState(() {
          isDown = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isDown = false;
        });
      },
      child: SizedBox(
        height: 60.0,
        child: Material(
          borderRadius: BorderRadius.circular(30.0),
          shadowColor: Colors.blueAccent,
          color: Theme.of(context).primaryColor,
          elevation: isDown ? 0 : 7.0,
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
