import 'package:elemination_round_app/features/authentication/display/cubit/authentication_cubit.dart';
import 'package:elemination_round_app/features/login/display/cubit/login_cubit/login_cubit.dart';
import 'package:elemination_round_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/login_button_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is FailLogin) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(state.error),
                  const Icon(Icons.error)
                ],
              ),
            ));
        } else if (state is LoadingLogin) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text('Ingresando'),
                  CircularProgressIndicator()
                ],
              ),
            ));
        } else if (state is SuccessLogin) {
          context.read<AuthenticationCubit>().authetnicationUserChanged();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(
              content: Text('Bienvenido'),
              ),
            );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.loginBackground.path),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.33),
                BlendMode.darken,
              ),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                color: Colors.white.withOpacity(0.85),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    const Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40
                      ),
                    ),
                    const Text(
                      'Ludus elimination App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 24),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Usuario',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xff7A7A7A),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xff7A7A7A),
                                    ),
                                  ),
                                ),
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (_) => !context
                                        .read<LoginCubit>()
                                        .state
                                        .isEmailValid
                                    ? 'Email Invalido'
                                    : null,
                                onChanged: (email) {
                                  context
                                      .read<LoginCubit>()
                                      .emailChanged(email: email);
                                },
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 30),
                                width:
                                    MediaQuery.of(context).size.width * 0.8,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        'Contraseña',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Color(0xff7A7A7A),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Color(0xff7A7A7A),
                                          ),
                                        ),
                                      ),
                                      controller: _passwordController,
                                      obscureText: true,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (_) => !context
                                              .read<LoginCubit>()
                                              .state
                                              .isPasswordValid
                                          ? 'Constraseña Invalida'
                                          : null,
                                      onChanged: (password) {
                                        context
                                            .read<LoginCubit>()
                                            .passwordChanged(
                                                password: password);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 60, bottom: 40, left: 40, right: 40),
                          child: LoginButtonWidget(
                            onPressed:
                                context.read<LoginCubit>().isFormValid()
                                    ? (() async {await context
                                        .read<LoginCubit>()
                                        .loginWithCredentialsPressed(
                                          email: _emailController.text,
                                          password: _passwordController.text);
                                    })
                                    : null,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
