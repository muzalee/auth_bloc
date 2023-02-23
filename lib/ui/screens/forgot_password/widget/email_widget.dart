import 'package:auth_bloc/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:auth_bloc/configs/routes.dart';
import 'package:auth_bloc/utils/styles/button.dart';
import 'package:auth_bloc/utils/styles/text.dart';
import 'package:auth_bloc/utils/styles/textfield.dart';
import 'package:auth_bloc/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class EmailWidget extends StatefulWidget {
  const EmailWidget({super.key});

  @override
  State<StatefulWidget> createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  late ForgotPasswordBloc _bloc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ForgotPasswordBloc>(context);
  }

  @override
  void dispose() {
    _emailController.dispose();
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
            child: const Icon(CupertinoIcons.lock_rotation),
          ),
          const SizedBox(height: 10),
          Text('Forgot Password?', style: header1Text()),
          const SizedBox(height: 15),
          Text("No worries, we'll send you reset instructions. Enter the email associated with you account.", style: regularText(color: Colors.black54))
        ],
      ),
    );
  }

  Widget _form() {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: TextFormField(
            controller: _emailController,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
            style: regularText(),
            decoration: bottomBorderedTextField(
              borderColor: Colors.grey,
              hintColor: Colors.grey,
              hint: 'Enter your email',
            ),
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter email';
              }

              if (!Validators.isValidEmail(value)) {
                return 'Invalid email';
              }

              return null;
            },
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
      child: Text('Reset Password', style: regularText(color: Colors.white),),
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

  //action functions
  void onSubmit() {
    _bloc.add(const TogglePage(pageIndex: 1));
    if (_formKey.currentState!.validate()) {
    }
  }
}