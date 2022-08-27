import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key, required this.checkNum}) : super(key: key);
  final String checkNum;
  //VerifyScreen(this.phone);
  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //TextEditingController _OTPcontroller = TextEditingController();
  //for OTP text field
  @override
  void initState() {
    super.initState();
    verifyNumber();
  }

  void verifyNumber() async {
    await Firebase.initializeApp();
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${widget.checkNum}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          // to autofill the otp if the sms is on the same device as that of the authentication
          String newOTP = credential.smsCode.toString();
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Not Verified!!!!!!");
          print(e.stackTrace);
        },
        codeSent: (String vID, int? resendToken) {
          print(vID);
        },
        codeAutoRetrievalTimeout: (String vID) {},
        timeout: Duration(seconds: 60));
  }
  String val1 = "";
  String val2 = "";
  String val3 = "";
  String val4 = "";
  String val5 = "";
  String val6 = "";
  String OtpValue = "";

  var text1 = TextEditingController();
  var text2 = TextEditingController();
  var text3 = TextEditingController();
  var text4 = TextEditingController();
  var text5 = TextEditingController();
  var text6 = TextEditingController();

  verifyOTP(String otp) {
    print('OTP by user' + otp);
    print('OTP by sms' + OtpValue);
    if (otp == OtpValue) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen(),),);}
      else{
        print("Invalid OTP");
    }
    }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
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
                Image.asset('images/illustration-3.png', width: 200),
                Text(
                  'Verification',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Enter the OTP sent to your registered mobile number}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 17,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 85,
                              child: AspectRatio(
                                aspectRatio: 0.6,
                                child: TextFormField(
                                  controller: text1,
                                  onSaved: (newValue) => val1 = newValue!,
                                  autofocus: true,
                                  onChanged: (value) {
                                    FocusScope.of(context).nextFocus();
                                  },
                                  showCursor: false,
                                  readOnly: false,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.deepPurple),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.deepPurple),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 85,
                              child: AspectRatio(
                                aspectRatio: 0.6,
                                child: TextFormField(
                                  controller: text2,
                                  onSaved: (newValue) => val2 = newValue!,
                                  autofocus: true,
                                  onChanged: (value) {
                                    FocusScope.of(context).nextFocus();
                                  },
                                  showCursor: false,
                                  readOnly: false,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.deepPurple),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.deepPurple),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 85,
                              child: AspectRatio(
                                aspectRatio: 0.6,
                                child: TextFormField(
                                  controller: text3,
                                  onSaved: (newValue) => val3 = newValue!,
                                  autofocus: true,
                                  onChanged: (value) {
                                    FocusScope.of(context).nextFocus();
                                  },
                                  showCursor: false,
                                  readOnly: false,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.deepPurple),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.deepPurple),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 85,
                              child: AspectRatio(
                                aspectRatio: 0.6,
                                child: TextFormField(
                                  controller: text4,
                                  onSaved: (newValue) => val4 = newValue!,
                                  autofocus: true,
                                  onChanged: (value) {
                                    FocusScope.of(context).nextFocus();
                                  },
                                  showCursor: false,
                                  readOnly: false,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.deepPurple),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.deepPurple),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 85,
                              child: AspectRatio(
                                aspectRatio: 0.6,
                                child: TextFormField(
                                  controller: text5,
                                  onSaved: (newValue) => val5 = newValue!,
                                  autofocus: true,
                                  onChanged: (value) {
                                    FocusScope.of(context).nextFocus();
                                  },
                                  showCursor: false,
                                  readOnly: false,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.deepPurple),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.deepPurple),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 85,
                              child: AspectRatio(
                                aspectRatio: 0.6,
                                child: TextFormField(
                                  controller: text6,
                                  onSaved: (newValue) => val6 = newValue!,
                                  autofocus: true,
                                  onChanged: (value) {
                                    FocusScope.of(context).previousFocus();
                                  },
                                  showCursor: false,
                                  readOnly: false,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.deepPurple),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.deepPurple),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                ),
                              ),
                            ),

                            // _textFieldOTP(first: false, last: false),
                            // _textFieldOTP(first: false, last: false),
                            // _textFieldOTP(first: false, last: false),
                            // _textFieldOTP(first: false, last: false),
                            // _textFieldOTP(first: false, last: true),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.deepPurple),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ))),
                            onPressed: () {
                              var otpValue = text1.text + text2.text + text3.text + text4.text + text5.text + text6.text;
                              print(otpValue);
                              verifyOTP(otpValue);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(14),
                              child: Text(
                                'Verify',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Didn\'t recieve any code?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend the code',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
