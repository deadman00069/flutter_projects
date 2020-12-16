import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heavy_bucket/screens/initial_setup_screens/add_detail_page.dart';

class OTPVerification {
  final String phNo;
  bool error = false;
  final BuildContext context;
  OTPVerification({@required this.phNo, @required this.context});
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  void dialogBox(String verificationId, int resendToken) {
    String smsCode;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Please Enter OTP'),
            content: Form(
              key: _formKey,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'OTP',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter valid OTP';
                  }
                  if (error) {
                    return 'Please Enter Correct OPT';
                  }
                  return null;
                },
                onSaved: (value) {
                  smsCode = value;
                },
              ),
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Submit"),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    print(smsCode);
                    PhoneAuthCredential phoneAuthCredential =
                        PhoneAuthProvider.credential(
                            verificationId: verificationId, smsCode: smsCode);

                    // Sign the user in (or link) with the credential
                    try {
                      await _auth
                          .signInWithCredential(phoneAuthCredential)
                          .then((value) =>
                              Navigator.pushNamed(context, AddDetailScreen.id));
                    } catch (e) {
                      errorMessage();
                    }
                  }
                },
              ),
            ],
          );
        });
  }

  void errorMessage() {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        'OTP Incorrect please enter valid otp',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
    ),
    );
  }

  void verificationDone(PhoneAuthCredential credential) async {
    await _auth
        .signInWithCredential(credential)
        .then((value) => Navigator.pushNamed(context, AddDetailScreen.id));
  }

  void verificationFail(FirebaseAuthException e) {
    print(e);
  }

  void codeSent(String verificationId, int resendToken) async {
    String smsCode = '';
    dialogBox(verificationId, resendToken);
    // Create a PhoneAuthCredential with the code
  }

  void getVerified() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phNo,
      verificationCompleted: verificationDone,
      verificationFailed: verificationFail,
      codeSent: codeSent,
      timeout: const Duration(seconds: 120),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  }
}
