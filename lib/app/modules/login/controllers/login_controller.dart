import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/Constants.dart';
import '../../Transition/views/transition_view.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  void apiLogin(String email, password) async {
    Get.dialog(Center(
        child: ClipRRect(
      child: Image.asset(
        'assets/images/kaisehai.gif',
        alignment: Alignment.center,
        fit: BoxFit.fill,
      ),
    )));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenvalue = prefs.getString("token");
    Response response = await post(
        Uri.parse('${Constants.connectionString}/login'),
        headers: <String, String>{
          'Authorization': 'Bearer $tokenvalue',
        },
        body: {
          'email': emailTextController.text,
          'password': passwordTextController.text
        }).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        Get.back();
        return Constants.showtoastError("Plz check your internet Connection");
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['message'] == "Bad creds") {
        Fluttertoast.showToast(
          msg: 'Invalid Email or Password',
          backgroundColor: Colors.red,
        );
        Get.back();
      } else {
        Fluttertoast.showToast(
          msg: 'logged In Successfully',
          backgroundColor: Colors.green,
        );
      }
      print(response.body);
      String token = data['token'];
      prefs.setString("token", token);
      print(token);
      Get.to(() => TransitionView());
    } else {
      print(response.statusCode);
      Get.back();
      Fluttertoast.showToast(
        msg: 'Invalid Email or Password',
        backgroundColor: Colors.red,
      );
    }
  }
}
