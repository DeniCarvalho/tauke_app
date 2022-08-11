import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
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
  String? errorMessage;
  FocusNode focusInput = FocusNode();

  @override
  void initState() {
    super.initState();
    loadPage();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  loadPage() async {
    await Future.delayed(const Duration(milliseconds: 500));
    // ignore: use_build_context_synchronously
    FocusScope.of(context).requestFocus(focusInput);
  }

  void _submit() {}

  @override
  Widget build(BuildContext context) {
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
                        text: 'Qual o seu número de ',
                        style: TextStyle(
                          fontSize: 28.fontSize,
                          fontWeight: FontWeight.w400,
                          color: Provider.of<ThemeBloc>(context).isDark()
                              ? AppColorsDark.secondary
                              : AppColors.secondary,
                        ),
                      ),
                      TextSpan(
                        text: 'celular',
                        style: TextStyle(
                          fontSize: 28.fontSize,
                          fontWeight: FontWeight.bold,
                          color: Provider.of<ThemeBloc>(context).isDark()
                              ? AppColorsDark.secondary
                              : AppColors.secondary,
                        ),
                      ),
                      TextSpan(
                        text: '?',
                        style: TextStyle(
                          fontSize: 28.fontSize,
                          fontWeight: FontWeight.w400,
                          color: Provider.of<ThemeBloc>(context).isDark()
                              ? AppColorsDark.secondary
                              : AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                IntlPhoneField(
                  focusNode: focusInput,
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
                  invalidNumberMessage: errorMessage,
                  controller: _controller,
                  // autovalidateMode: AutovalidateMode.disabled,
                  validator: (value) {
                    if (value!.number.isEmpty) {
                      setState(() {
                        errorMessage = 'Informe o número';
                      });
                      return '';
                    } else {
                      Country country = countries.firstWhere((element) =>
                          "+${element.dialCode}" == value.countryCode);
                      if (!(value.number.length == country.maxLength ||
                          value.number.length > country.minLength &&
                              value.number.length < country.maxLength)) {
                        setState(() {
                          errorMessage = 'Número inválido';
                        });
                        return '';
                      }
                    }

                    setState(() {
                      errorMessage = '';
                    });
                    return null;
                  },
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
                    onPressed: _controller.value.text.isNotEmpty &&
                            (errorMessage == null || errorMessage!.isEmpty)
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
    );
  }
}
