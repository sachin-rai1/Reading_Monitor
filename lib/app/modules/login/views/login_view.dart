import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../data/GetXNetworkManagement.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool isChecked = false;

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  late ScaffoldMessengerState scaffoldMessenger;
  final LoginController _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  void validateEmail() {
    final bool isValid = EmailValidator.validate(
        _loginController.emailTextController.text.trim());

    if (isValid) {
      if (_formKey.currentState!.validate()) {
        _loginController.apiLogin(
            _loginController.emailTextController.text.toString(),
            _loginController.passwordTextController.text.toString());
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid Email')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final LoginController loginController = Get.put(LoginController());
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green;
      }
      return Colors.red;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: h / 3.5,
                color: const Color(0xFF52C0A5),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 15),
                      child: const Text(
                        'WELCOME',
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: ''),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 2),
                    const Text(
                      'to online reading Monitor',
                      style: TextStyle(
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          child: Image.asset('assets/images/Correct.png',
                              height: 15, width: 15),
                        ),
                        const Text(
                          'Demo Text',
                          style: TextStyle(
                              fontSize: 12,
                              //fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        ClipRRect(
                          child: Image.asset('assets/images/Correct.png',
                              height: 15, width: 15),
                        ),
                        const Text(
                          'Demo Text',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            child: Image.asset('assets/images/Correct.png',
                                height: 15, width: 15),
                          ),
                          const Text(
                            'Demo Text',
                            style: TextStyle(
                                fontSize: 12,
                                //fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0)),
                ),
                padding:
                    EdgeInsets.only(top: h / 3, right: w / 10, left: w / 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: h / 18),
                        child: ClipRRect(
                          child: Image.asset('assets/images/RmLogo.png',
                              height: h / 10, width: w),
                        ),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )),
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'Email Required' : null,
                        controller: loginController.emailTextController,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )),
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'Password required' : null,
                        controller: _loginController.passwordTextController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: '***************',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          const Text('Remember Me'),
                          SizedBox(
                            width: w / 10,
                          ),
                          const Text('Forgot Password ?'),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: ElevatedButton(
                              onPressed: () {
                                validateEmail();
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(w / 2, 40.42),
                                  primary: const Color(0xFF716259),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                    minimumSize: Size(w / 2, 41.42),
                                    primary: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    )),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Image.asset(
                                          'assets/images/GoogleIcon.png',
                                          height: 28,
                                          width: 28),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Sign In With Google',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
