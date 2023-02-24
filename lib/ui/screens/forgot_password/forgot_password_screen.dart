import 'package:auth_bloc/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:auth_bloc/utils/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/code_widget.dart';
import 'widget/email_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ForgotPasswordBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<ForgotPasswordBloc>(
        create: (context) => ForgotPasswordBloc(),
        child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
          builder: (context, state) {
            _bloc = BlocProvider.of<ForgotPasswordBloc>(context);

            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Column(
                      children: [
                        Expanded(
                          child: state.pageIndex == 0 ? const EmailWidget() : const CodeWidget(),
                        ),
                        const SizedBox(height: 10),
                        _pageNumber(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  //widget function
  Widget _pageNumber() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: _bloc.state.pageIndex == 0 ? Colors.black : Colors.grey,
          radius: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: Text('1', style: smallText(color: _bloc.state.pageIndex == 0 ? Colors.black : Colors.grey)),
          ),
        ),
        const SizedBox(width: 10),
        CircleAvatar(
          backgroundColor: _bloc.state.pageIndex == 1 ? Colors.black : Colors.grey,
          radius: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: Text('2', style: smallText(color: _bloc.state.pageIndex == 1 ? Colors.black : Colors.grey)),
          ),
        ),
        const SizedBox(width: 10),
        CircleAvatar(
          backgroundColor: _bloc.state.pageIndex == 2 ? Colors.black : Colors.grey,
          radius: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: Text('3', style: smallText(color: _bloc.state.pageIndex == 2 ? Colors.black : Colors.grey)),
          ),
        ),
      ],
    );
  }
}