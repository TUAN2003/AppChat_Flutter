import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../utils/helper.dart';
import '../../config/route.dart';
import 'widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return GestureDetector(
      onTap: () {
        _phoneFocusNode.unfocus();
        _passwordFocusNode.unfocus();
      },
      child: Scaffold(
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
                                    'Xin chào',
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Đăng nhập với NeoChat',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(115, 0, 0, 0),
                                    ),
                                  )
                                ],
                              ),
                            ),
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
                                      textInputAction: TextInputAction.next,
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
                                    InputPasswordFeild(
                                      focusNode: _passwordFocusNode,
                                      hint: 'Mật khẩu',
                                      label: 'Mật khẩu',
                                      prefixIcon: const Icon(
                                        Icons.lock_rounded,
                                        color: Color.fromARGB(255, 234, 158, 5),
                                      ),
                                      textInputAction: TextInputAction.done,
                                      controller: _passwordController,
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
                                            'Đăng nhập',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        onPressed: () async {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            if (await loginProvider.handleLogin(
                                              phone: _phoneController.text,
                                              password:
                                                  _passwordController.text,
                                            )) {
                                              if (context.mounted) {
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                  context,
                                                  mapRouteName[RouteName.main]!,
                                                  (route) => false,
                                                );
                                              }
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                    gap,
                                    SizedBox(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Lấy lại mật khẩu',
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            child: const Text('Đăng kí'),
                                            onPressed: () =>
                                                Navigator.pushNamed(
                                                    context,
                                                    mapRouteName[RouteName
                                                        .signUpPhone]!),
                                          )
                                        ],
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
                _showLoadingOverlay(loginProvider.status),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _showLoadingOverlay(StatusLogin status) {
    if (status == StatusLogin.checking) {
      return const LoadingOverlay();
    }
    return const SizedBox();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
  }
}
