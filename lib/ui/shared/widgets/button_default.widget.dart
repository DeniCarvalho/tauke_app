import 'package:flutter/material.dart';
import 'package:tauke_app/ui/shared/shared.dart';

class ButtonDefault extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool loading;
  final bool disabled;
  const ButtonDefault({
    Key? key,
    this.text = 'Confirmar',
    this.onPressed,
    this.loading = false,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              vertical: 15.0.responsiveHeight,
              horizontal: 18.0.responsiveWidth,
            ),
          ),
        ),
        onPressed: !disabled && onPressed != null ? onPressed : null,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          switchInCurve: Curves.ease,
          switchOutCurve: Curves.easeIn,
          child: loading
              ? SizedBox(
                  height: 20.0.responsiveHeight,
                  width: 20.0.responsiveWidth,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2.0,
                    backgroundColor: AppColorsDark.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColorsDark.secondary,
                    ),
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: AppColorsDark.secondary,
                    fontSize: 16.fontSize,
                  ),
                ),
        ),
      ),
    );
  }
}
