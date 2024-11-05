import 'package:appchat/config/config.dart';
import 'package:appchat/views/auth/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';

final defaultPinTheme = PinTheme(
  width: 40,
  height: 45,
  textStyle: const TextStyle(
      fontSize: 18,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(
      width: 2,
      color: const Color.fromARGB(255, 152, 144, 153),
    ),
    borderRadius: BorderRadius.circular(8),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: Color.fromRGBO(114, 178, 238, 1), width: 2),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: Color.fromRGBO(234, 239, 243, 1),
  ),
);

class VerifyScreen extends StatefulWidget {
  final String phone;
  final String verificationId;
  const VerifyScreen(
      {super.key, required this.phone, required this.verificationId});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.pop(context);
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.arrow_back),
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            flex: 2,
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/logo_verify.jpg'),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Text(
                  'Nhập mã OTP đã được gửi đến',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Center(
                  child: SizedBox(
                    width: 300, // Giới hạn chiều rộng của Row
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'số điện thoại',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Flexible(
                          child: Text(
                            widget.phone,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                gap,
                Pinput(
                  controller: textEditingController,
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) async {
                    await Future.delayed(Duration(seconds: 1));
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                      verificationId:
                          widget.verificationId, // ID xác thực từ Firebase
                      smsCode: pin, // OTP mà người dùng nhập
                    );
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(credential);
                      Navigator.pushReplacementNamed(
                          context, mapRouteName[RouteName.signUpPassword]!);
                    } catch (e) {
                      Fluttertoast.showToast(
                          msg: 'otp khong dun', toastLength: Toast.LENGTH_LONG);
                    }
                  },
                ),
                gap,
                TextCountDownTimer()
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
