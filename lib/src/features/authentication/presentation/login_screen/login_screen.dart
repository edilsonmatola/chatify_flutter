import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../../application/application_export.dart';
import '../../application/authentication_provider_service.dart';
import '../../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Responsive UI for diferent devices
  late double _deviceWidth;
  late double _deviceHeight;

  late AuthenticationProviderService _auth;
  late NavigationService _navigationService;

  final _loginFormKey = GlobalKey<FormState>();

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    _auth = Provider.of<AuthenticationProviderService>(context);
    _navigationService = GetIt.instance.get<NavigationService>();
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth * .03,
            vertical: _deviceHeight * .02,
          ),
          width: _deviceWidth * .97,
          height: _deviceHeight * .98,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: _deviceHeight * .10,
                child: const Text(
                  'Chatify',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: _deviceHeight * .04,
              ),
              _loginForm(),
              SizedBox(
                height: _deviceHeight * .05,
              ),
              RoundedButton(
                name: 'Login',
                width: _deviceWidth * .65,
                height: _deviceHeight * .075,
                onPress: () {
                  if (_loginFormKey.currentState!.validate()) {
                    _loginFormKey.currentState!.save();
                    _auth.loginUsingEmailAndPassword(_email!, _password!);
                  }
                },
              ),
              SizedBox(
                height: _deviceHeight * .02,
              ),
              TextButton(
                onPressed: () => _navigationService.nagivateRoute('/register'),
                child: const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return SizedBox(
      height: _deviceHeight * .25,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Email Field
            CustomTextFormField(
              onSaved: (_value) {
                setState(() {
                  _email = _value;
                });
              },
              regularExpression:
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
              hintText: 'Email',
              obscureText: false,
            ),
            // Password Field
            CustomTextFormField(
              onSaved: (_value) {
                setState(() {
                  _password = _value;
                });
              },
              // Password longer than 8 chars
              regularExpression: r".{8,}",
              hintText: 'Password',
              obscureText: true,
            )
          ],
        ),
      ),
    );
  }
}
