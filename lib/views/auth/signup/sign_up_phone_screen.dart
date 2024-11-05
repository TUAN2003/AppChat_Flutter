import 'package:appchat/views/auth/verify_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import '../../../config/route.dart';
import '../../../utils/helper.dart';
import '../widgets.dart';

class SignUpPhoneScreen extends StatefulWidget {
  const SignUpPhoneScreen({super.key});

  @override
  State<SignUpPhoneScreen> createState() => _SignUpPhoneScreenState();
}

class _SignUpPhoneScreenState extends State<SignUpPhoneScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _phoneFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _phoneFocusNode.unfocus(),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton.small(
          onPressed: () => Navigator.pop(context),
          shape: const CircleBorder(),
          child: const Icon(Icons.arrow_back),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.fast,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Đăng ký',
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Hãy nhập số điện thoại',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(115, 0, 0, 0),
                                      ),
                                    )
                                  ],
                                )),
                            Expanded(
                              flex: 6,
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    const Logo(
                                      scale: 0.35,
                                    ),
                                    gap,
                                    TextFormField(
                                      focusNode: _phoneFocusNode,
                                      textInputAction: TextInputAction.done,
                                      controller: _phoneController,
                                      validator: (value) =>
                                          Helper.validatePhone(value),
                                      keyboardType: TextInputType.phone,
                                      decoration: const InputDecoration(
                                        labelText: 'Số điện thoại',
                                        hintText: 'Số điện thoại',
                                        hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              123, 137, 134, 134),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.phone_rounded,
                                          color:
                                              Color.fromARGB(255, 54, 199, 58),
                                        ),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    gap,
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            'Tiếp tục',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        onPressed: () async {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            await FirebaseAuth.instance
                                                .verifyPhoneNumber(
                                              phoneNumber: '+840383875782',
                                              verificationCompleted:
                                                  (credential) async {},
                                              verificationFailed: (e) {
                                                Fluttertoast.showToast(
                                                    msg: 'loi',
                                                    toastLength:
                                                        Toast.LENGTH_LONG);
                                              },
                                              codeSent: (verificationId,
                                                  resendToken) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        VerifyScreen(
                                                      phone:
                                                          _phoneController.text,
                                                      verificationId:
                                                          verificationId,
                                                    ),
                                                  ),
                                                );
                                              },
                                              codeAutoRetrievalTimeout:
                                                  (String verificationId) {},
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _phoneFocusNode.dispose();
  }
}
