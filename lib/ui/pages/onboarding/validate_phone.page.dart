import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../../blocs/blocs.dart';
import '../../shared/shared.dart';

class OnboardingValidatePhonePage extends StatefulWidget {
  const OnboardingValidatePhonePage({Key? key}) : super(key: key);

  @override
  State<OnboardingValidatePhonePage> createState() =>
      _OnboardingValidatePhonePageState();
}

class _OnboardingValidatePhonePageState
    extends State<OnboardingValidatePhonePage> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return BodyAdaptive(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            iconSize: 35.fontSize,
            icon: const Icon(AntDesign.swapleft),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Get.back();
            },
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.responsiveWidth,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Código de ',
                        style: TextStyle(
                          fontSize: 28.fontSize,
                          fontWeight: FontWeight.w400,
                          color: Provider.of<ThemeBloc>(context).isDark()
                              ? AppColorsDark.secondary
                              : AppColors.secondary,
                        ),
                      ),
                      TextSpan(
                        text: 'verificação',
                        style: TextStyle(
                          fontSize: 28.fontSize,
                          fontWeight: FontWeight.bold,
                          color: Provider.of<ThemeBloc>(context).isDark()
                              ? AppColorsDark.secondary
                              : AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Enviado para o número ',
                        style: TextStyle(
                          fontSize: 15.fontSize,
                          fontWeight: FontWeight.w400,
                          color: Provider.of<ThemeBloc>(context).isDark()
                              ? AppColorsDark.secondary
                              : AppColors.secondary,
                        ),
                      ),
                      TextSpan(
                        text: '+55 11 957930736',
                        style: TextStyle(
                          fontSize: 15.fontSize,
                          fontWeight: FontWeight.bold,
                          color: Provider.of<ThemeBloc>(context).isDark()
                              ? AppColorsDark.secondary
                              : AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Pinput(
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    autofocus: true,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) => print(pin),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ButtonText(
                  text: 'Reenviar código',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
