import 'package:flutter/material.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/core/constants/image_asset.dart';
import 'package:school_management_system/presentation/widgets/auth/custom_button_auth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: boldBlueColor,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Positioned(
                  top: 190,
                  child: Container(
                    height: 812,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: whiteColor,

                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 160),
                          Text('Email', style: TextStyle(color: greyColor)),
                          Container(
                            alignment: Alignment.center,
                            width: 335,
                            child: TextFormField(
                              style: TextStyle(
                                color: darkBlueGrayColor,
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: greyColor),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 35),
                          Text('Password', style: TextStyle(color: greyColor)),
                          Container(
                            alignment: Alignment.center,
                            width: 335,
                            child: TextFormField(
                              style: TextStyle(
                                color: darkBlueGrayColor,
                                fontSize: 16,
                              ),

                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: greyColor,
                                  ),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: greyColor),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),

                          CustomButtonAuth(text: 'SIGN IN'),
                          Container(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: blackColortext,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 67.4,
                  left: 64.13,
                  child: Image.asset(
                    APPImageAsset.appbarImage,
                    width: 294.59,
                    height: 131.36,
                  ),
                ),
                Positioned(
                  top: 222,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          color: blackColortext,
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Sign in to continue',
                        style: TextStyle(
                          color: greyColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
