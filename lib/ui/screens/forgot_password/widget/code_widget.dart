import 'package:auth_bloc/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:auth_bloc/configs/routes.dart';
import 'package:auth_bloc/utils/styles/button.dart';
import 'package:auth_bloc/utils/styles/text.dart';
import 'package:auth_bloc/utils/styles/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CodeWidget extends StatefulWidget {
  const CodeWidget({super.key});

  @override
  State<StatefulWidget> createState() => _CodeWidgetState();
}

class _CodeWidgetState extends State<CodeWidget> {
  late ForgotPasswordBloc _bloc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<TextEditingController> _controllers = [];
  List<FocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    for (var e in _focusNodes) {
      e.dispose();
    }
    for (var e in _controllers) {
      e.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _notice(),
        const SizedBox(height: 30),
        _form(),
        const SizedBox(height: 20),
        _login(),
      ],
    );
  }

  //widget function
  Widget _notice() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Icon(CupertinoIcons.envelope_open),
          ),
          const SizedBox(height: 10),
          Text('Password Reset', style: header1Text()),
          const SizedBox(height: 15),
          Text('Code is sent to example@email.com.', style: regularText(color: Colors.black54))
        ],
      ),
    );
  }

  Widget _form() {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(index == 0 ? 0 : index == 3 ? 10 : 5, 0, index == 3 ? 0 : index == 0 ? 10 : 5, 0),
                  child: TextFormField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: borderedTextField(hideError: true),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        if (value.length > 1) {
                          _controllers[index].text = value[value.length - 1];
                        }
                        if (index + 1 == _focusNodes.length) {
                          FocusScope.of(context).unfocus();
                        } else {
                          _focusNodes[index + 1].requestFocus();
                        }
                      } else {
                        if (index > 0) {
                          _focusNodes[index - 1].requestFocus();
                        }
                      }
                    },
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return '';
                      }
                      return null;
                    },
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 20),
        _button(),
      ],
    );
  }

  Widget _button() {
    return ElevatedButton(
      onPressed: onSubmit,
      style: mainButton(),
      child: Text('Continue', style: regularText(color: Colors.white),),
    );
  }

  Widget _login() {
    return TextButton(
        onPressed: () => AppNavigator.pop(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.arrow_back, color: Colors.grey, size: 15.sp),
            const SizedBox(width: 5),
            Text('Back to login', style: smallText(color: Colors.black54)),
          ],
        )
    );
  }

  //local functions
  void init() {
    _bloc = BlocProvider.of<ForgotPasswordBloc>(context);
    _controllers = List.generate(4, (index) => TextEditingController());
    _focusNodes = List.generate(4, (index) => FocusNode());

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _focusNodes[0].requestFocus();
    });
  }

  //action functions
  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      _bloc.add(const TogglePage(pageIndex: 2));
    }
  }
}