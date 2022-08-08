import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../blocs/blocs.dart';

class OnboardingNamePage extends StatelessWidget {
  const OnboardingNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnboardingBloc bloc = Provider.of<OnboardingBloc>(context);
    return Scaffold(
      body: Container(),
    );
  }
}
