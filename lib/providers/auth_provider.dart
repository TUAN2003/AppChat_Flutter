import 'package:appchat/models/user_model.dart';

import '../utils/constants/key_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StatusLogin {
  initial,
  checking,
  failed,
  success,
}

class LoginProvider with ChangeNotifier {
  StatusLogin _status = StatusLogin.initial;
  StatusLogin get status => _status;

  Future<bool> handleLogin({
    required String phone,
    required String password,
  }) async {
    _status = StatusLogin.checking;
    notifyListeners();
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where('phone', isEqualTo: phone)
        .where('password', isEqualTo: password)
        .get();
    final doc = result.docs.firstOrNull;
    // delay animation
    await Future.delayed(const Duration(seconds: 1));
    if (doc != null) {
      // success
      _status = StatusLogin.success;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(KeyPref.keyLoggedIn, true);
      // await prefs.setStringList(
      //     keyUser, UserModel.fromDocSnap(doc).toStringList());
      return true;
    }
    _status = StatusLogin.failed;
    notifyListeners();
    return false;
  }
}

enum StatusSignUp {
  initial,
  sendingOTP,
  verifying,
  success,
  failed,
}

class SignUpProvider with ChangeNotifier {
  StatusSignUp _status = StatusSignUp.initial;
  StatusSignUp get status => _status;
  late UserModel _user;
  UserModel get user => _user;
}

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String phoneNumber = '';
  String smsCode = '';
  String verificationId = '';
  bool codeSent = false;

  void verifyPhone(final phone) async {
    await _auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 90),
      phoneNumber: phone,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (authException) {},
      codeSent: (verId, resendToken) {},
      codeAutoRetrievalTimeout: (verId) {
        verificationId = verId;
      },
    );
  }

  void signInWithOTP() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
    } catch (e) {}
  }
}
