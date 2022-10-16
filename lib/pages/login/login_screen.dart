import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_logger/theme/color.dart';
import 'package:location_logger/widget/mytext.dart';

import '../../Theme/config.dart';
import '../../utils/validators.dart';
import '../../widget/customTextField.dart';
import '../home/home_page.dart';

class Login extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: Get.height - 120,
              child: Column(
                children: [
                  Image.network(
                    'https://i.pinimg.com/736x/0d/cf/b5/0dcfb548989afdf22afff75e2a46a508.jpg',
                    width: 150,
                    height: 200,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: MyText(
                      title: 'Login',
                      size: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: MyText(
                      title: 'Login to see full app',
                      size: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextField(
                    controller: userNameController,
                    hint: 'User Name',
                    keyboardType: TextInputType.text,
                    correctionHint: (val) {
                      return Validators.validateName(val, text: 'please enter correct user name');
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextField(
                    controller: passController,
                    password: _isObscure,
                    suffixIcon: Icons.visibility,
                    hint: 'Password',
                    correctionHint: (val) {
                      return Validators.validatePw(val);
                    },
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        if(formKey.currentState!.validate()){
                          Get.to(HomePage());
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: Config().appColor,
                      ),
                      child: Text(
                        "Login",
                        style: Get.theme.textTheme.subtitle1!
                            .copyWith(color: white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
