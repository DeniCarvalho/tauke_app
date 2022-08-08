import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:tauke_app/ui/shared/shared.dart';

import '../../../blocs/blocs.dart';

class OnboardingPhonePage extends StatefulWidget {
  const OnboardingPhonePage({Key? key}) : super(key: key);

  @override
  State<OnboardingPhonePage> createState() => _OnboardingPhonePageState();
}

class _OnboardingPhonePageState extends State<OnboardingPhonePage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {}

  @override
  Widget build(BuildContext context) {
    final bool iphonex = MediaQuery.of(context).size.height >= 812.0;
    final double bottomPadding = iphonex ? 16.0 : 0.0;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: Provider.of<ThemeBloc>(context).isDark()
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
        ),
      ),
      body: SafeArea(
        bottom: false,
        top: false,
        child: Padding(
          padding: EdgeInsets.only(
            top: 40.responsiveHeight,
            bottom: bottomPadding + 10,
            left: 20.responsiveWidth,
            right: 20.responsiveWidth,
          ),
          child: SizedBox(
            width: double.infinity,
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
                              text: 'Qual o seu número de ',
                              style: TextStyle(
                                fontSize: 28.fontSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'celular',
                              style: TextStyle(
                                fontSize: 28.fontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '?',
                              style: TextStyle(
                                fontSize: 28.fontSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      IntlPhoneField(
                        pickerDialogStyle: PickerDialogStyle(
                          searchFieldInputDecoration: const InputDecoration(
                            labelText: 'Pesquisar país',
                          ),
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Informe o número',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialCountryCode: 'BR',
                        invalidNumberMessage: 'Número inválido',
                        controller: _controller,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                vertical: 15.0.responsiveHeight,
                              ),
                            ),
                          ),
                          onPressed: _controller.value.text.isNotEmpty
                              ? _submit
                              : null,
                          child: Text(
                            'CONTINUAR',
                            style: TextStyle(
                              color: AppColorsDark.secondary,
                              fontSize: 16.fontSize,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
