import 'package:flutter/material.dart';
import 'package:tauke_app/ui/shared/shared.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const ButtonText({
    Key? key,
    this.text = 'Adicionar',
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16.fontSize,
          ),
        ),
      ),
    );
  }
}
