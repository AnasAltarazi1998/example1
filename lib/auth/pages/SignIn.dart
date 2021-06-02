import 'package:example1/auth/bloc/auth_bloc.dart';
import 'package:example1/auth/pages/form.dart';
import 'package:example1/auth/pages/widgets/BottomWidget.dart';
import 'package:example1/auth/pages/widgets/base_widget.dart';
import 'package:example1/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  SignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Builder(
        builder: (ctxt) => BlocProvider<AuthBloc>(
          create: (context) {
            return BaseWidget.of(ctxt).authBloc;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('auth example'),
              centerTitle: true,
            ),
            body: Column(children: [
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is SignInSuccessed) {
                    Get.offAllNamed('/profile');
                  } else if (state is SignInFaildState) {
                    Get.snackbar('error message', state.errorMessage);
                  }
                },
                builder: (context, state) {
                  if (state is AuthInitial) {
                    return SignInForm();
                  } else if (state is SignInProcessing) {
                    return CircularProgressIndicator();
                  } else if (state is SignInFaildState) {
                    return SignInForm();
                  } else {
                    return Image.asset('assets/appbar.jpg');
                  }
                },
              ),
              Spacer(),
              BottomWidget()
            ]),
          ),
        ),
      ),
    );
  }
}
