import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/cubit/login_cubit.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/service/login_service.dart';
import 'package:flutter_full_learn/demos/password_text_field.dart';
import 'package:flutter_full_learn/product/service/vexana_network_manager.dart';
import 'package:kartal/kartal.dart';

import '../cubit/login_cubit_state.dart';

part 'login_view.g.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _loginText = 'Login';
  final GlobalKey<FormState> _formLoginKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginService(VexanaNetworkManager())),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state.isLoading
                  ? CircularProgressIndicator.adaptive(
                      backgroundColor: context.colorScheme.onSecondary,
                    )
                  : const SizedBox.shrink();
            },
          ),
        ),
        body: Form(
          key: _formLoginKey,
          child: Padding(
            padding: const _PaddingUtility.all(),
            child: Column(
              children: [
                _LoginEmailFields(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                _LoginButton(
                    formLoginKey: _formLoginKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    loginText: _loginText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PaddingUtility extends EdgeInsets {
  const _PaddingUtility.all() : super.all(20.0);
  const _PaddingUtility.bottom() : super.only(bottom: 10.0);
}
