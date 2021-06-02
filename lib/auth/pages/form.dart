import 'package:example1/auth/bloc/auth_bloc.dart';
import 'package:example1/auth/pages/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(
            controller: BaseWidget.of(context).emailController,
          ),
          TextField(
            controller: BaseWidget.of(context).passwordController,
          ),
          ElevatedButton(
            onPressed: () {
              BaseWidget.of(context).authBloc.add(SignInEvent(
                  passwordVal: BaseWidget.of(context).passwordController.text,
                  emailVal: BaseWidget.of(context).emailController.text));
            },
            child: Text('SignIn'),
          )
        ],
      ),
    );
  }
}
