import 'package:flutter/material.dart';

import '../component_widget/component_button.dart';
import '../component_widget/component_textformfield.dart';


class RegistrationScreenPage extends StatefulWidget {
  const RegistrationScreenPage({super.key});

  @override
  State<RegistrationScreenPage> createState() => _RegistrationScreenPageState();
}

class _RegistrationScreenPageState extends State<RegistrationScreenPage> {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPhoneNo = TextEditingController();
  final TextEditingController _controllerEmainId = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConformPassword = TextEditingController();

  bool isLoad = false;

  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration",style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: Colors.blueAccent,
       automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             ComponentTextformfield(
                 key: Key("regUsername"),
                 label: "Username",
                 textHint: "Enter Username",
                 textInputType: TextInputType.name,
                 prefixIcon: Icons.person,
                 validatorn: (value)
                 {
                   var userName = RegExp(r'^[a-zA-Z][a-zA-Z0-9_]{2,19}$');
                    if(value == null || value.isEmpty)
                      {
                         return "Please Enter Username";
                      }
                    else if(userName.hasMatch(value))
                      {
                          return "user_123";
                      }
                    return null;
                 },
                 controller: _controllerUsername
             ),
            SizedBox(height: 30,),
            ComponentTextformfield(
                key: Key("regPhoneno"),
                label: "Phone No",
                textHint: "Enter Phone No",
                prefixIcon: Icons.phone,
                validatorn: (value)
                {
                   RegExp phoneReg = RegExp(r'^\+?[1-9]\d{1,14}$');
                   if(value == null || value.isEmpty)
                     {
                        return "Please Enter Phone No";
                     }
                   else if(phoneReg.hasMatch(value))
                     {
                         return "Enter a valid phone no";
                     }
                },
                controller: _controllerPhoneNo
            ),
            SizedBox(height: 30,),
            ComponentTextformfield(
              key: Key("regEmail"),
                controller: _controllerEmainId,
                prefixIcon: Icons.email_outlined,
                label: "Email Id",
                textHint: "Enter Email Id",
                textInputType: TextInputType.emailAddress,
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
              key: Key("regPassword"),
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
            ComponentTextformfield(
                key: Key("regConfirmPassword"),
                controller: _controllerConformPassword,
                prefixIcon: Icons.lock,
                label: "Password",
                textHint: "Enter Password",
                textInputType: TextInputType.text,
                validatorn: (value)
                {
                  if(value == null || value.isEmpty)
                  {
                    return "Please Enter Password";
                  }
                  else if(value != _controllerPassword.text)
                  {
                    return "Confirm Password doesn't match";
                  }
                  return null;
                }
            ),
              SizedBox(height: 40),
              ComponentButton(
                  key: Key("regBtn"),
                  label: "Register",
                  isLoading: isLoad,
                  suffixIcon: Icons.app_registration,
                  onPress: () async{
                      if(_keyForm.currentState!.validate())
                        {
                           setState(() {
                               isLoad = true;
                           });

                           await Future.delayed(Duration(seconds: 3));
                           setState(() {
                             isLoad = false;
                           });
                        }
                  }
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    key: Key("navLog"),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Login")
                  )
              ],)
          ],),
        ),
      ),
    );
  }
}
