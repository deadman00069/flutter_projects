import 'package:flutter/material.dart';
import 'package:heavy_bucket/constants/style.dart';
import 'package:heavy_bucket/model/opt_verification.dart';
import 'package:heavy_bucket/widgets/custom_button.dart';

class OtpScreen extends StatefulWidget {
  static const id = 'OtpScreen';

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();

  String phNo;

  String _validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Phone no is required';
    }
    if (value.length < 10 || value.length > 10) {
      return 'Please enter valid phone no';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(0),
              height: MediaQuery.of(context).size.height - 40,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image(
                      image: AssetImage('assets/images/drill.png'),
                    ),
                    Text(
                      'OTP Verification',
                      textAlign: TextAlign.center,
                      style: kStyle1,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(style: kStyle2, children: <TextSpan>[
                        TextSpan(text: 'We will send you an'),
                        TextSpan(
                          text: ' One Time Password ',
                          style: kStyle3,
                        ),
                        TextSpan(text: 'on this mobile number'),
                      ]),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Enter Mobile Number',
                          style: kStyle2,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: null,
                                fillColor: Colors.white,
                                filled: true,
                                hintText: '3322113344',
                                hintStyle: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.bold),
                                alignLabelWithHint: true),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold),
                            onChanged: (value) {
                              phNo = value;
                            },
                            validator: _validatePhoneNumber,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomOTPButton(_formKey, phNo),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class CustomOTPButton extends StatelessWidget {
  final _formKey;
  final String phNo;
  CustomOTPButton(this._formKey, this.phNo);
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Get OTP',
      color: Color(0xffFFCE33),
      function: () {
        if (_formKey.currentState.validate()) {
          // _formKey.currentState.save();
          print(phNo);
          OTPVerification verification =
              OTPVerification(phNo: '+91' + phNo, context: context);
          verification.getVerified();
        }
      },
    );
  }
}
