import 'package:firebase_offline/core/navigation/app_routes.dart';
import 'package:firebase_offline/core/widgets/custom_buttom.dart';
import 'package:firebase_offline/core/widgets/custom_text_form_field.dart';
import 'package:firebase_offline/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          switch (state) {
            case AuthInitial():
              return SafeArea(
                minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _signup(),
                        const SizedBox(height: 50),
                        _emailField(),
                        const SizedBox(height: 20),
                        _buildPasswordWidget(),
                        const SizedBox(height: 20),
                        _createUserButtom(),
                        const SizedBox(height: 20),
                        _buildOrWidget(),
                      ],
                    ),
                  ),
                ),
              );
            case AuthLoading():
              return Center(child: CircularProgressIndicator());
            case AuthFailure():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Ups hubo un error", style: TextStyle(fontSize: 32),),
                    const SizedBox(height: 20),
                    _goToBackButtom()
                  ],
                ),
              );
            case AuthSuccess():
              return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _signup() {
    return const Text(
      'Sign Up',
      style: TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
    );
  }

  Widget _emailField() {
    return CustomTextFormField(controller: _emailController, hint: "Email");
  }

  Widget _buildPasswordWidget() {
    return CustomTextFormField(
      obscureText: true,
      controller: _passwordController,
      hint: "Password",
    );
  }

  Widget _createUserButtom() {
    return Builder(
      builder: (context) {
        return Row(
          children: [
            CustomButton(
              text: "Create Account",
              onPressed: () => BlocProvider.of<AuthBloc>(context).add(
                OnCreateUserWithEmailAndPassword(
                  _emailController.text,
                  _passwordController.text,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOrWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 35),
      child: Row(
        children: [
          Expanded(child: Divider(indent: 2, height: 2)),
          Text("  Or sign in with  "),
          Expanded(child: Divider(endIndent: 2, height: 2)),
        ],
      ),
    );
  }

  Widget _goToBackButtom() {
    return Builder(
      builder: (context) {
        return CustomButton(
          text: "Go to Sign up",
          onPressed: () => context.pushReplacement(AppRoutes.register),
        );
      },
    );
  }
}
