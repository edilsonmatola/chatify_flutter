// Packages
import 'package:flutter/material.dart';

// Widgets
import '../widgets/custom_input_fields.dart';
import '../widgets/rounded_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Responsive UI for diferent devices
  late double _deviceWidth;
  late double _deviceHeight;

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      body: Container(
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
            _pageTitle(),
            SizedBox(
              height: _deviceHeight * .04,
            ),
            _loginForm(),
            SizedBox(
              height: _deviceHeight * .05,
            ),
            _loginButton(),
            SizedBox(
              height: _deviceHeight * .02,
            ),
            _registerAccountLink(),
          ],
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return Container(
      height: _deviceHeight * .10,
      child: Text(
        'Chatify',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      height: _deviceHeight * .20,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Email Field
            CustomTextFormField(
              onSaved: (_value) {},
              regularExpression:
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
              hintText: 'Email',
              obscureText: false,
            ),
            // Password Field
            CustomTextFormField(
              onSaved: (_value) {},
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

  Widget _loginButton() {
    return RoundedButton(
      name: 'Login',
      width: _deviceWidth * .65,
      height: _deviceHeight * .070,
      onPress: () {},
    );
  }

  Widget _registerAccountLink() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Text(
          "Don't have an account?",
          style: TextStyle(
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}