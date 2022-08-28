import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../blocs/blocs.dart';
import '../../shared/shared.dart';

class OnboardingIntroPage extends StatelessWidget {
  const OnboardingIntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyAdaptive(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0.responsiveHeight),
            child: Logo(
              height: 50.fontSize,
              path: Provider.of<ThemeBloc>(context).isDark()
                  ? AppImages.logoFullLight
                  : AppImages.logoFullDark,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.chat,
                height: 220.responsiveHeight,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 30,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Bem-vindo, ',
                      style: TextStyle(
                        fontSize: 22.fontSize,
                        color: Provider.of<ThemeBloc>(context).isDark()
                            ? AppColorsDark.secondary
                            : AppColors.secondary,
                      ),
                    ),
                    TextSpan(
                      text: 'Tauker!',
                      style: TextStyle(
                        fontSize: 22.fontSize,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 17.responsiveWidth,
                ),
                child: Text(
                  'Sua loja favorita ainda mais acessível. Compre ou venda sem sair do chat.',
                  style: TextStyle(
                    fontSize: 18.fontSize,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.responsiveWidth,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Clique em "Aceitar e continuar" para aceitar os ',
                        style: TextStyle(
                          fontSize: 14.fontSize,
                          color: Provider.of<ThemeBloc>(context).isDark()
                              ? AppColors.system
                              : AppColors.secondary,
                        ),
                      ),
                      TextSpan(
                        text: 'Termos de uso e Política de Privacidade',
                        style: TextStyle(
                          fontSize: 14.fontSize,
                          color: Theme.of(context).primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ButtonDefault(
                  text: 'Aceitar e continuar',
                  onPressed: () {
                    Get.toNamed('/onboarding/phone');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
