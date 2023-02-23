import 'package:auth_bloc/bloc/auth/auth_bloc.dart';
import 'package:auth_bloc/configs/assets.dart';
import 'package:auth_bloc/utils/const/color_const.dart';
import 'package:auth_bloc/utils/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/form_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            _bloc = BlocProvider.of<AuthBloc>(context);
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorConst.primary,
                    ColorConst.secondary
                  ],
                ),
              ),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          _logo(),
                          _toggleButton(),
                          const Expanded(
                            child: FormWidget(),
                          ),
                          _accountButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  //widget function
  Widget _logo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 35, 0, 70),
      child: Row(
        children: [
          const Image(image: AppIcons.logo, height: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text('AUTH APP', style: smallText(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _toggleButton() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => _bloc.add(const TogglePage(isLogin: true)),
          child: Container(
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: _bloc.state.isLogin ? ColorConst.primary : Colors.transparent, width: 2)
              ),
            ),
            child: Text('Login', style: largeText(color: _bloc.state.isLogin ? Colors.white : Colors.grey)),
          ),
        ),
        const SizedBox(width: 10),
        Text('OR', style: regularText(color: Colors.grey)),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => _bloc.add(const TogglePage(isLogin: false)),
          child: Container(
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: _bloc.state.isLogin ? Colors.transparent : ColorConst.primary, width: 2)
              ),
            ),
            child: Text('Sign Up', style: largeText(color: _bloc.state.isLogin ? Colors.grey : Colors.white)),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _accountButton() {
    return TextButton(
      onPressed: () => _bloc.add(TogglePage(isLogin: !_bloc.state.isLogin)),
      child: RichText(
        text: TextSpan(
          style: regularText(),
          children: <TextSpan>[
            TextSpan(text: _bloc.state.isLogin ? "Don't have an account? " : "Already have an account? "),
            TextSpan(text: _bloc.state.isLogin ? 'Sign Up' : 'Login', style: regularText(fontWeight: FontWeight.bold, color: ColorConst.primary)),
          ],
        ),
      ),
    );
  }
}
