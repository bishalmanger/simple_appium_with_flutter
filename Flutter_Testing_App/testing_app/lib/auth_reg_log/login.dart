import 'package:flutter/material.dart';

import '../component_widget/component_button.dart';
import '../component_widget/component_textformfield.dart';
import '../main.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({super.key});

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  final _keyForm = GlobalKey<FormState>();

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  bool Check = false;
  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login_page",style: TextStyle(color: Colors.white),key: ValueKey("loginpage"),),centerTitle: true, automaticallyImplyLeading: false,backgroundColor: Colors.blueAccent,),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _keyForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ComponentTextformfield(
                    key: Key("logEmailCompKey"),
                    formFieldKey: ValueKey("username_input"),
                    controller: _controllerEmail,
                    prefixIcon: Icons.person,
                    label: "Email Id",
                    textHint: "Enter Email Id",
                    textInputType: TextInputType.text,
                    validatorn: (value)
                    {
                       var emailReg = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                       if(value == null|| value.isEmpty)
                         {
                            return "Please Enter Email Id";
                         }
                       else if(!emailReg.hasMatch(value))
                         {
                            return "Enter valid Email Id";
                         }
                       return null;
                    }
                ),
              SizedBox(height: 30,),
              ComponentTextformfield(
                  key: Key("logPassCompKey"),
                  formFieldKey: ValueKey("password_input"),
                  controller: _controllerPassword,
                  prefixIcon: Icons.lock,
                  label: "Password",
                  textHint: "Enter Password",
                  textInputType: TextInputType.text,
                  validatorn: (value)
                  {
                    var passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',);
                      if(value == null || value.isEmpty)
                        {
                           return "Please Enter Password";
                        }
                      else if(!passwordRegExp.hasMatch(value))
                        {
                           return "Valid password MySecurePassword1@";
                        }
                      return null;
                  }
              ),
            SizedBox(height: 30,),
            ComponentButton(
                key: Key("cmp"),

                KeyCompB: ValueKey("login_button"),
                label: "Login",
                isLoading: isLoad,
                responseLog: ValueKey("login_chack"),
                onPress: () async{
                   if(_keyForm.currentState!.validate())
                     {
                       setState(() {
                         isLoad = true;
                         Check = true;
                         Navigator.pushReplacementNamed(context, LoginAutomationTestingWithAppium.Home);
                       });
                       await Future.delayed(Duration(seconds: 3));
                       setState(() {
                         isLoad = false;
                       });
                       // Navigator.pushReplacementNamed(context, LoginAutomationTestingWithAppium.Home);
                       print("Successful");
                       _controllerEmail.clear();
                       _controllerPassword.clear();
                     }
                   else
                     {
                       Check = false;
                     }
                },
                suffixIcon: Icons.login_outlined,
            ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text("Don't have an account?"),
                   TextButton(
                       key: Key("navReg"),
                       onPressed: (){
                         Navigator.pushNamed(context, LoginAutomationTestingWithAppium.Reg);
                       },
                       child: Text("Sign Up")
                   ),
                    Visibility(
                        visible: true,
                        child: Text(Check?"success":"failed", key: ValueKey("loginCheck")))
                ],)
            ],),
          ),
        ),
    );
  }
}
