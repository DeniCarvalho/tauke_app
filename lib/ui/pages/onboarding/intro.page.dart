import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../blocs/blocs.dart';
import '../../shared/shared.dart';

class OnboardingIntroPage extends StatelessWidget {
  const OnboardingIntroPage({Key? key}) : super(key: key);

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
            top: 80.responsiveHeight,
            bottom: bottomPadding + 10,
            left: 20.responsiveWidth,
            right: 20.responsiveWidth,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Logo(
                  height: 50.fontSize,
                  path: Provider.of<ThemeBloc>(context).isDark()
                      ? AppImages.logoFullLight
                      : AppImages.logoFullDark,
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
                        'Sua loja favorita ainda mais acessível. Compre e venda sem sair do chat.',
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
                        height: 8,
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
                          onPressed: () {
                            Get.toNamed('/onboarding/phone');
                          },
                          child: Text(
                            'Aceitar e continuar',
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
