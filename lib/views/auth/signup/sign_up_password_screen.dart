import 'package:flutter/material.dart';

import '../../../config/route.dart';
import '../../../utils/helper.dart';
import '../widgets.dart';

class SignUpPasswordScreen extends StatefulWidget {
  const SignUpPasswordScreen({super.key});

  @override
  State<SignUpPasswordScreen> createState() => _SignUpPasswordScreenState();
}

class _SignUpPasswordScreenState extends State<SignUpPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _confirmController = TextEditingController();
  final _confirmFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _passwordFocusNode.unfocus();
        _confirmFocusNode.unfocus();
      },
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
                                      'Hãy tạo mật khẩu',
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
                                  children: <Widget>[
                                    const Logo(
                                      scale: 0.35,
                                    ),
                                    gap,
                                    TextFormField(
                                      focusNode: _passwordFocusNode,
                                      obscureText: true,
                                      textInputAction: TextInputAction.next,
                                      validator: (value) =>
                                          Helper.validatePassword(value),
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        labelText: 'Mật khẩu',
                                        hintText: 'Mật khẩu',
                                        hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              123, 137, 134, 134),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.lock_rounded,
                                          color:
                                              Color.fromARGB(255, 234, 158, 5),
                                        ),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    gap,
                                    InputPasswordFeild(
                                      focusNode: _confirmFocusNode,
                                      hint: 'Xác nhận mật khẩu',
                                      label: 'Xác nhận mật khẩu',
                                      prefixIcon: const Icon(
                                        Icons.done_all_rounded,
                                        color: Color.fromARGB(255, 54, 199, 58),
                                      ),
                                      textInputAction: TextInputAction.done,
                                      controller: _confirmController,
                                      validator: (value) =>
                                          Helper.validatePassword(value),
                                      showIconSuffix: const Icon(
                                        Icons.visibility_outlined,
                                        color: Color.fromRGBO(126, 87, 194, 1),
                                      ),
                                      hideIconSuffix: const Icon(
                                        Icons.visibility_off_outlined,
                                        color: Color.fromRGBO(126, 87, 194, 1),
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
                                        onPressed: () {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            Navigator.pushNamed(
                                                context,
                                                mapRouteName[
                                                    RouteName.signUpInfo]!);
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
    _passwordController.dispose();
    _confirmController.dispose();
    _passwordFocusNode.dispose();
    _confirmFocusNode.dispose();
  }
}
