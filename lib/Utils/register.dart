import 'package:flutter/material.dart';
import 'package:otp_verification/Utils/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_phone_auth_handler.dart';

import 'form_error.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  // Future<void> verifyPhoneNumber() async{
  //   try{
  //     //await _auth.verify
  //   }
  //   catch(e){
  //
  //   }
  // }
  TextEditingController _phoneController = TextEditingController();

  late String phone;
  final List<String> errors = [];
  void addError({required String error}){
    if(!errors.contains(error)){
      setState(() {
        errors.add(error);
      });
    }
  }
  void removeError({required String error}){
    if(errors.contains(error)){
      setState(() {
        errors.remove(error);
      });
    }
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )),
                  Image.asset('images/illustration-2.png', width: 100),
                  Text(
                    'Registration',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Add you number and we will send you a verification code. Your account will be created as soon as you are verified',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 17,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _phoneController,
                          onSaved: (newValue)=>phone = newValue!,
                          //onChange is used to see the text change in the text field
                          onChanged: (value){
                            // the text field is empty
                            if(value.isNotEmpty) {
                              removeError(error: "please enter your phone number");
                            }
                            //if the number entered has less than 10 digits
                            if(value.length==10) {
                              removeError(error: "Please enter a valid phone number");
                            }

                          },
                          validator: (value){
                            if(value!.isEmpty){
                              addError(error: "please enter your phone number");
                              return "";
                            }
                            else if(value.length != 10){
                              addError(error: "Please enter a valid phone number");
                              return "";
                            }
                            return null;
                          },
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            hintText: 'Phone Number',
                            prefix: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                '+91',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),

                            ),

                          ),
                        ),
                        FormError(errors: errors, key: ValueKey('error')),
                        SizedBox(height: 20),
                        //SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    )
                                )
                            ),
                            onPressed: () {
                              if(_formKey.currentState!.validate()){
                                _formKey.currentState!.save();

                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => VerifyScreen(checkNum: phone, key: const ValueKey('OTP Screen')),),);
                              }
                              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => VerifyScreen(),),);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(14),
                              child: Text('Get OTP', style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),),
                            ),
                          ),
                        )

                      ],
                    ),
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
