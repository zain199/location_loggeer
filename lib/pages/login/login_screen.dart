import 'package:Dohatana/pages/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Dohatana/controllers/auth_controller.dart';
import 'package:Dohatana/theme/color.dart';
import 'package:Dohatana/widget/mytext.dart';

import '../../Theme/config.dart';
import '../../common/constants/assets.dart';
import '../../utils/validators.dart';
import '../../widget/customTextField.dart';
import '../home/home_page.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController userNameController = TextEditingController();

  TextEditingController passController = TextEditingController();

  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp)async {
      AuthController controller = Get.put(AuthController());
      bool success = await controller.tryAutoLogin();
      if(success)
        {
          Get.offAll(HomePage());
        }
    });
  }

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
                  Image.asset(logo , height: 200 , width: 120,),
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
                    child: GetBuilder<AuthController>(
                      init: AuthController(),
                      builder: (controller) {
                        return ElevatedButton(
                          onPressed: () async {
                            if(formKey.currentState!.validate()){
                             bool success= await controller.login(email: userNameController.text.trim(), password: passController.text.trim());
                              if(success)
                                {
                                  Get.offAll(HomePage());
                                }
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
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  // SizedBox(
                  //   height: 60,
                  //   width: double.maxFinite,
                  //   child: ElevatedButton(
                  //     onPressed: () async {
                  //             Get.to(RegisterScreen());
                  //     },
                  //
                  //     style: ElevatedButton.styleFrom(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(16),
                  //       ),
                  //       backgroundColor: Config().appColor,
                  //     ),
                  //     child: Text(
                  //       "Register",
                  //       style: Get.theme.textTheme.subtitle1!
                  //           .copyWith(color: white, fontSize: 20),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.03,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
