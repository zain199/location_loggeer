import 'package:Dohatana/common/constants/variables-methods.dart';
import 'package:Dohatana/pages/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Theme/config.dart';
import '../../common/constants/assets.dart';
import '../../theme/color.dart';
import '../../utils/validators.dart';
import '../../widget/customTextField.dart';
import '../../widget/mytext.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();

   TextEditingController emailController = TextEditingController();
   TextEditingController confirmPassController = TextEditingController();

   TextEditingController genderController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
   bool _isObscure = true;
   bool _isObscureCon = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body:  SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: Get.height - 70,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: MyText(
                      title: 'Register',
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
                      title: 'Register to see full app',
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
                      return Validators.validateName(val, text: 'Please enter correct user name');
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextField(
                    controller: emailController,
                    hint: 'Email',
                    keyboardType: TextInputType.text,
                    correctionHint: (val) {
                      return Validators.validateEmail(val,);
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextField(
                    controller: phoneController,
                    hint: 'Phone',
                    keyboardType: TextInputType.phone,
                    correctionHint: (val) {
                      return Validators.validatePhone(val);
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextField(
                    controller: genderController,
                    hint: 'Gender',
                    keyboardType: TextInputType.text,
                    correctionHint: (val) {
                      return Validators.validateName(val, text: 'Please enter correct gender');
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
                    height: size.height * 0.02,
                  ),

                  CustomTextField(
                    controller: confirmPassController,
                    password: _isObscureCon,
                    suffixIcon: Icons.visibility,
                    hint: 'Confirm Password',
                    correctionHint: (val) {
                      return Validators.validatePw(val);
                    },
                    maxLines: 1,
                  ),
                  const Spacer(),

                  SizedBox(
                    height: 60,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () async {
                          if(formKey.currentState!.validate()&&confirmPassController.text== passController.text)
                            {
                                showSuccessToast('Account Created Successfully');
                                Get.offAll(Login());
                                clearData();

                            }else
                              showErrorToast('Please Review All Data');
                      },

                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: Config().appColor,
                      ),
                      child: Text(
                        "Register",
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

  clearData()
  {
     userNameController .clear();
     passController .clear();

     emailController .clear();
     confirmPassController .clear();

     genderController .clear();
     phoneController .clear();
  }
}
