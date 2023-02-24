import 'package:auth_bloc/bloc/app/app_bloc.dart';
import 'package:auth_bloc/bloc/auth/auth_bloc.dart';
import 'package:auth_bloc/configs/routes.dart';
import 'package:auth_bloc/utils/styles/button.dart';
import 'package:auth_bloc/utils/styles/text.dart';
import 'package:auth_bloc/utils/styles/textfield.dart';
import 'package:auth_bloc/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<StatefulWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  late AuthBloc _bloc;
  late AppBloc _appBloc;

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>(), _registerFormKey =  GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController(), _emailController = TextEditingController(),
      _phoneController = TextEditingController(), _passwordController = TextEditingController(), _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<AuthBloc>(context);
    _appBloc = BlocProvider.of<AppBloc>(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        /*
            if (state.success) _appBloc.add(SetAuthentication
           */
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            _bloc.state.isLogin ? _loginForm() : _registerForm(),
            if (_bloc.state.isLogin) ...[
              const SizedBox(height: 2),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => AppNavigator.push(Routes.forgotPassword),
                  child: Text('Forgot Password', style: regularText(color: Colors.grey)),
                ),
              ),
            ],
            const SizedBox(height: 50),
            _signInButton(),
          ],
        );
      },
    );
  }

  //widget function
  Widget _loginForm() {
    return Form(
      key: _loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _email(),
          _password(),
        ],
      ),
    );
  }

  Widget _registerForm() {
    return Form(
      key: _registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _name(),
          _email(),
          _phone(),
          _password(),
          _confirmPassword(),
        ],
      ),
    );
  }

  Widget _name() {
    return Column(
      children: [
        TextFormField(
          controller: _nameController,
          textInputAction: TextInputAction.next,
          maxLines: 1,
          style: regularText(color: Colors.white),
          decoration: bottomBorderedTextField(
            borderColor: Colors.white,
            hintColor: Colors.grey.shade300,
            labelText: 'Full Name',
            prefixIcon: const Icon(Icons.person, color: Colors.white, size: 15),
          ),
          validator: (String? value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter name';
            }
            return null;
          },
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _email() {
    return Column(
      children: [
        TextFormField(
          controller: _emailController,
          textInputAction: TextInputAction.next,
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          style: regularText(color: Colors.white),
          decoration: bottomBorderedTextField(
            borderColor: Colors.white,
            hintColor: Colors.grey.shade300,
            labelText: 'Email',
            prefixIcon: const Icon(Icons.email, color: Colors.white, size: 15),
          ),
          validator: (String? value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter email';
            }

            if (!_bloc.state.isLogin && !Validators.isValidEmail(value)) {
              return 'Invalid email';
            }

            return null;
          },
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _phone() {
    return Column(
      children: [
        TextFormField(
          controller: _phoneController,
          textInputAction: TextInputAction.next,
          maxLines: 1,
          keyboardType: TextInputType.phone,
          style: regularText(color: Colors.white),
          decoration: bottomBorderedTextField(
            borderColor: Colors.white,
            hint: '0134567890',
            hintColor: Colors.grey.shade300,
            labelText: 'Phone Number',
            prefixIcon: const Icon(Icons.phone_android, color: Colors.white, size: 15),
          ),
          validator: (String? value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter phone number';
            }
            return null;
          },
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _password() {
    return TextFormField(
      controller: _passwordController,
      style: regularText(color: Colors.white),
      textInputAction: TextInputAction.go,
      decoration: bottomBorderedTextField(
        borderColor: Colors.white,
        hintColor: Colors.grey.shade300,
        labelText: 'Password',
        prefixIcon: const Icon(Icons.lock, color: Colors.white, size: 15),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.visibility_off, color: Colors.white, size: 15),
        ),
      ),
      obscureText: true,
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter password';
        }

        if (!_bloc.state.isLogin && !Validators.isValidPassword(value)) {
          return 'Weak password';
        }

        return null;
      },
    );
  }

  Widget _confirmPassword() {
    return TextFormField(
      controller:_confirmPasswordController,
      style: regularText(color: Colors.white),
      textInputAction: TextInputAction.go,
      decoration: bottomBorderedTextField(
        borderColor: Colors.white,
        hintColor: Colors.grey.shade300,
        labelText: 'Confirm Password',
        prefixIcon: const Icon(Icons.lock_open, color: Colors.white, size: 15),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.visibility_off, color: Colors.white, size: 15),
        ),
      ),
      obscureText: true,
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter password confirmation';
        }

        if (value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  Widget _signInButton() {
    return ElevatedButton(
      onPressed: onSubmit,
      style: mainButton(),
      child: Text(_bloc.state.isLogin ? 'Login' : 'Register', style: regularText(color: Colors.white),),
    );
  }

  //action functions
  void onSubmit() {
    if (_bloc.state.isLogin ? _loginFormKey.currentState!.validate() : _registerFormKey.currentState!.validate()) {
      AppNavigator.replaceWith(Routes.dashboard);
    }
  }
}