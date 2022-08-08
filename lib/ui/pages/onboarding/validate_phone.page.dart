import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../blocs/blocs.dart';

class OnboardingValidatePhonePage extends StatelessWidget {
  const OnboardingValidatePhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnboardingBloc bloc = Provider.of<OnboardingBloc>(context);
    return Scaffold(
      body: Container(),
    );
  }
}
