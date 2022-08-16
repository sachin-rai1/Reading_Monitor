import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';
import '../../../data/ConnectionString.dart';
import '../../Transition/views/transition_view.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();


  void apiLogin(String email, password) async {
    Get.dialog(const Center(child: CircularProgressIndicator()),
         );
    Response response = await post(
        Uri.parse(
            '${Constants.connectionString}/login'),
        body: {
          'email': emailTextController.text,
          'password': passwordTextController.text
        });
    if (response.statusCode == 201) {

      Fluttertoast.showToast(
        msg: 'logged In Successfully',
        backgroundColor: Colors.green,
      );
      Get.to(TransitionView());
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
