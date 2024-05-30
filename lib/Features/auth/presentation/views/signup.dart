import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/functions/alertexitapp.dart';
import '../../../../core/functions/validinput.dart';
import '../../../../core/shared/defult_dropdown_search.dart';
import '../../controller/signup_controller.dart';
import '../widgets/custom_signin_with_fb_or_gmail.dart';
import '../widgets/custombuttomauth.dart';
import '../widgets/customtextbody.dart';
import '../widgets/customtextform.dart';
import '../widgets/customtextsignuporsigin.dart';
import '../widgets/customtexttitle.dart';
import '../widgets/logoauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => SignUpCotrollerImp());
    return Scaffold(
        // backgroundColor: AppColor.backGround,
        // backgroundColor: Colors.white,
        body: WillPopScope(
      onWillPop: alertExitApp,
      child: GetBuilder<SignUpCotrollerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest!,
          widget: Container(
            // padding:
            // const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Form(
              key: controller.key,
              child: ListView(
                children: [
                  const LogoAuth(),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextTitleAuth(
                          title: 'انشاء حساب جديد',
                        ),
                        const SizedBox(height: 10),
                        const CustomTextBodyAuth(
                            text: ' اهلا بك! برجاء ادخال بياناتك'),
                        const SizedBox(height: 20),
                        CustomTextFormAuth(
                          hintText: 'اسم المستخدم',
                          lableText: 'اسم المستخدم',
                          iconData: Icons.person,
                          myController: controller.username,
                          validator: (value) {
                            return validinput(
                                val: value!, min: 5, max: 30, type: "username");
                          },
                        ),
                        CustomTextFormAuth(
                          hintText: 'البريد الالكترونى',
                          lableText: 'البريد الالكترونى',
                          iconData: Icons.email,
                          myController: controller.email,
                          validator: (value) {
                            return validinput(
                                val: value!, min: 5, max: 100, type: "email");
                          },
                        ),
                        CustomTextFormAuth(
                          hintText: '22'.tr,
                          lableText: '21'.tr,
                          iconData: Icons.phone_android_outlined,
                          myController: controller.phone,
                          isNumber: true,
                          validator: (value) {
                            return validinput(
                                val: value!, min: 11, max: 11, type: "phone");
                          },
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomTextFormAuth(
                                hintText: 'السن',
                                lableText: 'السن',
                                isNumber: true,
                                removePrefixIcon: true,
                                // iconData: Icons.email,
                                myController: controller.age,
                                validator: (value) {
                                  return validinput(
                                      val: value!, min: 1, max: 2, type: "age");
                                },
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: CustomDropDownSearch(
                                  title: "النوع",
                                  listdata: controller.genderDropDownList,
                                  onSelected: (name, selectedValue) {},
                                  validator: (value) {
                                    return validinput(
                                        val: value!,
                                        min: 1,
                                        max: 50,
                                        type: "gender");
                                  },
                                  dropdownSelectedName: controller.genderName,
                                  dropdownSelectedID: controller.genderId),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomDropDownSearch(
                                  title: "المحافظة",
                                  listdata: controller.govDropDownList,
                                  validator: (value) {
                                    return validinput(
                                        val: value!,
                                        min: 1,
                                        max: 50,
                                        type: "gov");
                                  },
                                  onSelected: (name, selectedValue) {
                                    controller.selectGovAndShowCity(
                                        selectedValue: selectedValue);
                                  },
                                  dropdownSelectedName: controller.govName,
                                  dropdownSelectedID: controller.govId),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: CustomDropDownSearch(
                                  title: "المدينة",
                                  disabled: controller.isDisabledCity,
                                  listdata: controller.cityDropDownList,
                                  onSelected: (name, selectedValue) {
                                    // controller.cityDropDownList.clear();
                                  },
                                  validator: (value) {
                                    return validinput(
                                        val: value!,
                                        min: 5,
                                        max: 30,
                                        type: "city");
                                  },
                                  dropdownSelectedName: controller.cityName,
                                  dropdownSelectedID: controller.cityId),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<SignUpCotrollerImp>(
                          builder: (controller) => CustomTextFormAuth(
                            hintText: 'كلمة السر',
                            lableText: 'كلمة السر',
                            iconData: Icons.lock,
                            suffixIcon: controller.isShowPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            myController: controller.password,
                            isPassword: controller.isShowPassword,
                            onTapIcon: () {
                              controller.showPassword();
                            },
                            validator: (value) {
                              return validinput(
                                  val: value!,
                                  min: 5,
                                  max: 30,
                                  type: "password");
                            },
                          ),
                        ),
                        GetBuilder<SignUpCotrollerImp>(
                          builder: (controller) => CustomTextFormAuth(
                            hintText: 'اعادة ادخال كلمة السر',
                            lableText: 'اعادة ادخال كلمة السر',
                            iconData: Icons.lock,
                            suffixIcon: controller.isShowPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            myController: controller.repassword,
                            isPassword: controller.isShowRePassword,
                            onTapIcon: () {
                              controller.showrePassword();
                            },
                            validator: (value) {
                              return validinput(
                                  val: value!,
                                  min: 5,
                                  max: 30,
                                  type: "password");
                            },
                          ),
                        ),
                        Row(
                          children: [
                            GetBuilder<SignUpCotrollerImp>(
                              builder: (controller) => Checkbox(
                                value: controller.isAgree,
                                onChanged: (value) {
                                  controller.changeAgree();
                                },
                              ),
                            ),
                            const Text(
                              "أوافق على الشروط والاحكام",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        CustomButtonAuth(
                          text: 'انشاء حساب',
                          width: double.infinity,
                          onPressed: () {
                            controller.signUp();
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextSignUpOrSignIn(
                          textOne: 'لدى حساب بالفعل؟ ',
                          textTwo: 'تسجيل الدخول',
                          onTap: () {
                            controller.goToLogin();
                          },
                        ),
                        const SizedBox(height: 20),
                        const CustomSignInWithFbOrGmail(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
